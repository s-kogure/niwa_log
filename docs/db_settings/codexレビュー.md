レビュー結果

1. 重大度: Critical
   理由: SQLが実行できません。regions の municipality_name 行末にカンマがなく、構文エラーになります。また plants テー
   ブル後に全角空白だけの行があり、環境によって不正トークンになります。
   修正案: municipality_name text not null, に修正し、全角空白行を削除する。migrationは最低限 psql で構文確認する。
   該当箇所: db_test/001_create_table.sql:39, db_test/001_create_table.sql:116

2. 重大度: High
   理由: 作成順と外部キーが破綻しています。user_plants が users / gardens より先に作られているため、user_id /
   garden_id にFKを張れていません。仕様上 user_plants は「このユーザーの、この庭にいる、この植物」なので、参照整合性
   がないのは大きいです。
   修正案: 作成順を users → regions → gardens → plants → user_plants → logs/tags/cache に整理し、user_id references
   users(id)、garden_id references gardens(id) を付ける。
   該当箇所: db_test/001_create_table.sql:40, db_test/001_create_table.sql:43, db_test/001_create_table.sql:44

3. 重大度: High
   理由: plant_master_requests がありません。資料では「申請中は plants に直接入れず、plant_master_requests に置く」が
   重要な責務分離として明記されています。現状だと植物マスタ登録フローの投稿先がなく、未承認情報をどう保持するかが欠け
   ています。
   修正案: plant_master_requests を追加する。requested_name、parent_id または parent_name_text、候補パラメータ、
   status、submitted_by、approved_plant_id、created_at/updated_at を持たせる。
   該当箇所: db_test/001_create_table.sql:5, 仕様: 要件定義資料/niwa_log_db_v0_2_review_memo.md:251, db_test/doc/
   niwa_log_plants_db_clean.md:142

4. 重大度: High
   理由: plants.created_from_request_id に参照先FKがありません。資料では plant_master_requests.id への参照として扱う
   想定です。今のままだと孤立IDを保存でき、承認履歴を追えません。
   修正案: plant_master_requests 作成後、created_from_request_id uuid references plant_master_requests(id) にする。循
   環参照が気になるなら、後段の alter table でFKを追加する。
   該当箇所: db_test/001_create_table.sql:32

5. 重大度: High
   理由: plants に approval_status / approved_at がありません。資料では plants 側にも承認状態・承認日時を持たせる方針
   が複数箇所にあります。特に「通常利用では plants だけを見る」前提なら、承認済みだけを扱う判断材料が必要です。
   修正案: approval_status text not null default 'approved' check (...) と approved_at timestamptz を追加する。ただし
   未承認は原則 plant_master_requests 側に置く。
   該当箇所: db_test/001_create_table.sql:5

6. 重大度: High
   理由: watering_logs が仕様より足りません。資料では amount と memo が想定カラムに含まれています。水やりログは「水や
   りした事実」ですが、「どれくらい」「理由や土の状態」は自由記述で残す方針です。
   修正案: amount text check (amount in ('light','moderate','heavy')) と memo text を追加する。ワンアクション記録を優
   先するならどちらも nullable でよいです。
   該当箇所: db_test/001_create_table.sql:87, 仕様: db_test/doc/niwa_log_plants_db_clean.md:362

7. 重大度: High
   理由: weather_cache の重複防止条件が仕様と違います。資料では region_id / target_date / source を重複させず再取得時
   に更新する方針ですが、SQLは fetched_at をuniqueに含めているため、取得時刻が違うだけで同じ対象日の同じAPIデータを何
   度でも保存できます。
   修正案: target_date date not null、source text not null を追加し、unique(region_id, target_date, source) に変更す
   る。fetched_at は一意キーから外す。
   該当箇所: db_test/001_create_table.sql:171, db_test/001_create_table.sql:176

8. 重大度: Medium
   理由: weather_cache に raw_json と precipitation_probability がありません。資料では後から項目追加するための保険と
   して raw_json を保持する方針です。天気API連携の仕様変更に耐えるには重要です。
   修正案: precipitation_probability numeric(5,2)、source text not null、raw_json jsonb、created_at/updated_at を追加
   する。
   該当箇所: db_test/001_create_table.sql:141

9. 重大度: Medium
   理由: gardens のNULL可否が登録フローとズレています。登録ステップ1では庭名と地域が入力対象なので name は必須に近い
   一方、ground_type / rain_exposure / wind_exposure は初回登録で入力しない項目です。現状は逆に、庭名がnullableで環境
   項目が必須です。
   修正案: name text not null にする。環境プロフィール系は nullable または unknown デフォルトを用意する。v1で軽めにす
   るなら memo に寄せる判断でもよいです。
   該当箇所: db_test/001_create_table.sql:126, db_test/001_create_table.sql:128

10. 重大度: Medium
    理由: observation_logs はYAGNIです。資料では「履歴型の plant_notes / 観察記録」はv1後回しで、v1では
    user_plants.memo で十分とされています。責務分離としては悪くないですが、今回のv1範囲とはズレます。
    修正案: v1 migrationから外す。観察記録を時系列で積む仕様が固まった時点で、別migrationとして追加する。
    該当箇所: db_test/001_create_table.sql:96

11. 重大度: Medium
    理由: user_plant_tags に重複防止がありません。同じ user_plant_id に同じ name を何度でも登録できます。自由ラベル方
    式としては成立しますが、タグ表示・編集で重複が出やすくなります。
    修正案: 現方式を続けるなら unique(user_plant_id, name) を追加する。資料の「tag_type はnullableでもよい」に合わせる
    なら tag_type text も追加する。
    該当箇所: db_test/001_create_table.sql:78, 仕様: db_test/doc/niwa_log_plants_db_clean.md:321

12. 重大度: Medium
    理由: unique(garden_id, nickname) は任意ニックネーム・論理削除と相性が悪いです。PostgreSQLでは NULL の重複は許され
    るため未入力の重複防止にはならず、逆に削除済み個体と同じ名前の再利用は妨げます。
    修正案: 必要なら where deleted_at is null and nickname is not null の部分unique indexにする。ニックネーム重複を許
    すUXなら制約を外す。
    該当箇所: db_test/001_create_table.sql:75

13. 重大度: Medium
    理由: plants.name unique は親子カテゴリを考えると強すぎる可能性があります。資料では2階層の親子構造があり、同名の一
    般名・品種名・別カテゴリの可能性を完全には排除できません。
    修正案: 本当に全植物マスタで名前一意にするならOK。ただし親子構造を活かすなら unique(parent_id, name) や、正規化し
    た検索名 normalized_name での重複防止を検討する。
    該当箇所: db_test/001_create_table.sql:37

14. 重大度: Medium
    理由: plants.parent_id の2階層制約がDB上では担保されていません。資料では「親を選んだ場合、その親がすでに子であれば
    エラー」と明記されています。
    修正案: アプリ側で担保するならSQLコメントに責務を明記する。DBで担保するならトリガーまたは制約関数を用意する。
    該当箇所: db_test/001_create_table.sql:7

15. 重大度: Low
    理由: watch_dry_out が text で 'true'/'false'/'conditional' を持つ設計は少し曖昧です。avoid_overwatering はboolean
    なので、対になる項目として型の意味が揺れています。
    修正案: 三値が必要なら watch_dry_out_level や dry_out_attention のようなenum寄りの名前にする。単純フラグでよいなら
    boolean にする。
    該当箇所: db_test/001_create_table.sql:24

16. 重大度: Low
    理由: timestamp と timestamptz が混在しています。水やり・観察・削除時刻はユーザー操作ログなので、タイムゾーン込み
    で保存する方が扱いやすいです。
    修正案: watered_at、observed_at、deleted_at を timestamptz に統一する。
    該当箇所: db_test/001_create_table.sql:73, db_test/001_create_table.sql:91, db_test/001_create_table.sql:99

総評: DB再構築前提なら、uuid 採用自体は問題ありません。ただし現状のSQLは「構文」「作成順」「FK」
「plant_master_requests」「weather_cacheの一意性」がまだmigrationとして危険です。まずはv1必須テーブルに絞って、責務分
離に直結するFKと重複防止を固めるのがよいです。

    直す順番はこれがおすすめです。

    1. 構文エラー修正
    2. テーブル作成順の整理
    3. users / regions / gardens / plants / plant_master_requests / user_plants のFK確定
    4. weather_cache の一意制約修正
    5. YAGNIな observation_logs を一旦外すか判断
