-- 010_seed_plants.sql
-- 植物マスタ初期seed
--
-- 投入順序:
--   1. 親植物（parent_id = null）をまとめてINSERT
--   2. 子植物（parent_idをサブクエリで取得）をINSERT
--
-- 冪等性:
--   ON CONFLICT (name) DO NOTHING により再実行安全
--
-- 調査ログ:
--   docs/seed_research/ 配下のカテゴリ別 Markdown を参照
--
-- カテゴリ別進捗:
--   [x] Session 0: anchor植物（moisture基準）
--   [x] Session 1: herb + orchid（子分類・マジョラムまで含む完全版）
--   [x] Session 2: succulent + fruit
--   [x] Session 3: foliage
--   [x] Session 4: flower
--   [x] Session 5: vegetable
-- 全 Session 完了。

begin;

-- =========================================================
-- 親植物（herb）
-- =========================================================

insert into public.plants (
  name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
) values
  -- band 2（乾燥寄り）
  ('ローズマリー',  'herb', 'shrub',      0.25, 'light',    '土の表面が乾いてから（2〜3日後を目安に）',
   '乾燥ぎみを好む。冬は更に乾かしぎみに。地植えは根付き後水やり不要。過湿・蒸れに注意。',
   ARRAY['マンネンロウ'], 'https://www.hyponex.co.jp/garden_support/garden_support-100/'),

  ('ラベンダー',    'herb', 'shrub',      0.21, 'light',    '土の表面がしっかり乾いてから',
   '高温多湿に弱い。日本の梅雨・夏場は過湿に特に注意。子分類（イングリッシュ・フレンチ・ラバンジン・レース）で管理差があるため詳しくは子レコードを参照。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-15070/'),

  ('タイム',       'herb', 'shrub',      0.25, 'light',    '土が乾いたら（冬は乾いてから1〜2日後）',
   '乾燥を好む。地植えは根付き後ほぼ水やり不要。水やりすぎは黄変・根腐れの原因。冬はやや控えめ。',
   ARRAY['タチジャコウソウ'], 'https://www.hyponex.co.jp/plantia/plantia-18746/'),

  ('オレガノ',     'herb', 'herbaceous', 0.23, 'light',    '土の表面が完全に乾くまで待ってから',
   '乾燥気味にしたほうが上手に育つ。地植えは基本水やり不要。水やりすぎると腐れやすい。',
   ARRAY['ハナハッカ'], 'https://www.hyponex.co.jp/plantia/plantia-6577/'),

  ('セージ',       'herb', 'shrub',      0.30, 'light',    '鉢土の表面が乾いたらたっぷり',
   '乾燥を好むが、タイム・ローズマリーより若干湿潤を許容。地植えは根付き後水やりほぼ不要。',
   ARRAY['コモンセージ'], 'https://www.hyponex.co.jp/garden_support/garden_support-218/'),

  ('レモングラス',  'herb', 'herbaceous', 0.35, 'light',    '鉢土の表面が乾いたらたっぷり（地植えは根付き後不要）',
   '根付いた後は比較的乾燥に強い。葉が丸まってきたら水不足のサイン。春の水やりすぎは根腐れの原因。熱帯性植物のため冬は室内管理が基本。',
   ARRAY[]::text[], 'https://www.kincho-engei.co.jp/cultivation/detail/4120/'),

  -- band 3（標準）
  ('バジル',       'herb', 'herbaceous', 0.50, 'moderate', '土の表面が乾いたら',
   '乾燥に弱いため水切れ注意。夏の乾燥期は朝夕の水やりが必要なことも。水のやりすぎは根を傷める。午前中の水やり推奨。1年草。',
   ARRAY['スイートバジル'], 'https://www.hyponex.co.jp/garden_support/garden_support-186/'),

  ('コリアンダー',  'herb', 'herbaceous', 0.50, 'moderate', '鉢土の表面が乾いたらたっぷり',
   '水を好む。夏は乾燥しやすいためこまめに。ただし与え過ぎは根腐れの原因。地植えは乾かし過ぎないよう管理。直根型で移植を嫌う。',
   ARRAY['パクチー', 'カメムシソウ'], 'https://www.hyponex.co.jp/garden_support/garden_support-244/'),

  ('パセリ',       'herb', 'herbaceous', 0.53, 'moderate', '土の表面が乾いたらたっぷり',
   '乾燥に弱い。夏は水切れに注意し朝夕の涼しい時間に水やり。半日陰を好む。イタリアンパセリとカールパセリは管理が同様なため aliases として扱う。',
   ARRAY['オランダゼリ', 'イタリアンパセリ', 'カールパセリ'], 'https://www.hyponex.co.jp/plantia/plantia-15795/'),

  ('フェンネル',   'herb', 'herbaceous', 0.50, 'moderate', '鉢土の表面が乾いたらたっぷり',
   '夏に乾燥させないよう注意。地植えは根付き後も乾かし過ぎないよう管理。直根性で移植を嫌う。草丈が高くなる（1〜2m）。',
   ARRAY['フヌイユ', 'ウイキョウ'], 'https://www.kincho-engei.co.jp/cultivation/detail/4242/'),

  ('ディル',       'herb', 'herbaceous', 0.50, 'moderate', '土の表面が乾いたらたっぷり',
   'フェンネルと同様の管理。直根性で移植を嫌う。乾燥しすぎに注意。草丈が高くなる（60〜100cm）。',
   ARRAY['イノンド'], 'https://www.hyponex.co.jp/plantia/plantia-17872/'),

  ('チャイブ',     'herb', 'herbaceous', 0.52, 'moderate', '土の表面が乾いたら株元にたっぷり',
   '夏は乾燥しやすいため回数多め。冬は地上部が枯れるが休眠はせず、乾燥しすぎると枯れる恐れあり。花も食用可。',
   ARRAY['エゾネギ', 'セイヨウアサツキ'], 'https://www.hyponex.co.jp/garden_support/garden_support-212/'),

  ('レモンバーム',  'herb', 'herbaceous', 0.60, 'moderate', '1日1回たっぷり（鉢底からあふれるくらい）',
   '乾燥すると葉が黄色く変色・しおれる。地植えは乾燥した日が続いたら。耐寒性が強く多年草。冬は地上部が枯れるが根は生きている。',
   ARRAY['メリッサ', 'コウスイハッカ'], 'https://www.hyponex.co.jp/plantia/plantia-16447/'),

  ('カモミール',   'herb', 'herbaceous', 0.55, 'moderate', '土の表面が乾いたら',
   '子分類（ジャーマン・ローマン）で一年草/多年草の差あり。詳しくは各子レコードを参照。高温多湿に弱い。',
   ARRAY['カミツレ'], 'https://www.hyponex.co.jp/plantia/plantia-5108/'),

  ('シソ',         'herb', 'herbaceous', 0.55, 'moderate', '土の表面が乾きかけているのを確認したらたっぷり',
   '夏の乾燥期は特に注意。マルチングで乾燥防止も有効。葉水も効果的（害虫防止にも）。1年草。',
   ARRAY['大葉', '紫蘇', 'アオジソ'], 'https://www.hyponex.co.jp/plantia/plantia-8747/'),

  -- band 4（湿潤寄り）
  ('ミント',       'herb', 'herbaceous', 0.65, 'moderate', '土の表面が乾いたら（乾燥しはじめたら早めに）',
   '乾燥に弱い。鉢植えは特に水切れ注意。保水性のある土が向く。繁殖力が非常に強いため地植えでは根の広がり対策が必要。品種による管理差は軽微。',
   ARRAY['ペパーミント', 'スペアミント', 'アップルミント'], 'https://www.hyponex.co.jp/garden_support/garden_support-127/'),

  ('マジョラム',   'herb', 'herbaceous', 0.27, 'light', '表面が乾いてからたっぷり（過湿は根腐れの原因）',
   '地中海原産のシソ科多年草。オレガノと近縁だが耐寒性が低く（霜×）、11月頃までに鉢上げして軒下等で越冬させる。高温多湿を苦手とするため風通し重視。',
   ARRAY['スイートマジョラム', 'マヨラナ'], 'https://horti.jp/14550')

on conflict (name) do nothing;

-- =========================================================
-- 親植物（orchid）
-- =========================================================

insert into public.plants (
  name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
) values
  ('胡蝶蘭',      'orchid', 'other', 0.55, 'moderate',
   '植え込み材料の表面が乾いて湿り気を感じなくなったら（水苔：春秋10〜14日に1回、夏週1回、冬月1回）',
   '熱帯着生ランのため高湿度を好むが根は「乾いてから」が鉄則。水苔とバークで頻度が異なる。鉢底水は必ず捨てる。葉付け根の水は拭き取る（カビ予防）。冬はぬるま湯を使う。',
   ARRAY['コチョウラン', 'ファレノプシス'], 'https://www.hyponex.co.jp/plantia/plantia-9667/'),

  ('シンビジウム', 'orchid', 'other', 0.52, 'moderate',
   '土の表面が乾いたらたっぷり（秋冬は週1〜2回）',
   '春〜秋は「表面が乾いたらたっぷり」の標準管理。秋冬は週1〜2回に固定。つぼみが出てきたら回数を増やす。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/garden_support/garden_support-227/'),

  ('デンドロビウム','orchid', 'other', 0.38, 'light',
   '植え込み材料が乾くまで待つ（10月以降は控えめ）',
   '多湿を嫌う。「植え込み材料が乾くまで待ってから与える」が鉄則。10月以降は控えめにして新芽の充実を促す。鉢皿の水は毎回捨てる。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/study/6473'),

  ('カトレア',     'orchid', 'other', 0.22, 'moderate',
   '植え込み材料の中心部が完全に乾いてから（冬は乾いても2〜3日待つ）',
   '洋ランの中でも特に乾燥を好む。CAM型光合成のため夕方の水やりが効果的。受け皿の水は毎回廃棄。',
   ARRAY[]::text[], 'https://www.kincho-engei.co.jp/cultivation/detail/4862/'),

  ('オンシジウム',  'orchid', 'other', 0.48, 'moderate',
   '土の表面が乾いたらたっぷりと（年間通じて）',
   '年間を通じて「表面が乾いたらたっぷり」の標準管理。特に夏場は乾燥しやすいため水枯れに注意。葉に縦方向のシワが寄ったら水不足のサイン。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-16019/')

on conflict (name) do nothing;

-- =========================================================
-- 子植物（herb）
-- =========================================================

-- ラベンダー子分類
insert into public.plants (
  parent_id, name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
)
select
  id, 'イングリッシュラベンダー', 'herb', 'shrub',
  0.20, 'light', '土の表面がしっかりと乾いてから',
  '日本の高温多湿に非常に弱い。梅雨・台風時は雨の当たらない場所に移動推奨。開花中のみ例外的にやや多め。耐寒性は強い。',
  ARRAY['アングスティフォリア系ラベンダー'], 'https://www.hyponex.co.jp/plantia/plantia-15070/'
from public.plants where name = 'ラベンダー'
on conflict (name) do nothing;

-- フレンチラベンダー
insert into public.plants (
  parent_id, name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
)
select
  id, 'フレンチラベンダー', 'herb', 'shrub',
  0.22, 'light', '鉢: 表面が乾いたらたっぷり（夏は蒸れ防止で控えめ）',
  'ストエカス系。イングリッシュより耐暑性が高く日本の夏でも育てやすいが、耐寒性はやや低い（-5℃程度）。過湿を嫌う点は他ラベンダーと共通。冬は鉢管理で必要に応じ室内へ。',
  ARRAY['ストエカス系ラベンダー', 'バタフライラベンダー'], 'https://www.hyponex.co.jp/garden_support/garden_support-114/'
from public.plants where name = 'ラベンダー'
on conflict (name) do nothing;

-- ラバンジン
insert into public.plants (
  parent_id, name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
)
select
  id, 'ラバンジン', 'herb', 'shrub',
  0.23, 'light', '鉢: 表面が乾いたらたっぷり（夏は控えめ）',
  'イングリッシュとスパイカ（スパイクラベンダー）の交雑種。耐暑性・耐寒性ともにバランスがよく、日本の暖地でも栽培可能。過湿を嫌う点は共通。多肥不要。',
  ARRAY['ラバンダン', 'ラバンディン'], 'https://www.kincho-engei.co.jp/cultivation/detail/5013/'
from public.plants where name = 'ラベンダー'
on conflict (name) do nothing;

-- レースラベンダー
insert into public.plants (
  parent_id, name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
)
select
  id, 'レースラベンダー', 'herb', 'shrub',
  0.22, 'light', '鉢: 表面が乾いたらたっぷり（長雨は避ける）',
  'ピナータ系。耐暑性は比較的あるが耐寒性が低く（-3℃以下で枯れやすい）冬は室内管理が基本。過湿に弱いため長雨を避けられる場所を選ぶ。',
  ARRAY['ピナータ系ラベンダー'], 'https://www.hyponex.co.jp/plantia/plantia-8858/'
from public.plants where name = 'ラベンダー'
on conflict (name) do nothing;

-- カモミール子分類
insert into public.plants (
  parent_id, name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
)
select
  id, 'ジャーマンカモミール', 'herb', 'herbaceous',
  0.58, 'moderate', '土の表面が乾いたら（地植えは乾燥しはじめたら早めに）',
  'やや湿り気のある土を好む。水切れに注意。高温多湿には弱い。一年草（こぼれ種で自然に増える）。',
  ARRAY[]::text[], 'https://www.hyponex.co.jp/garden_support/garden_support-225/'
from public.plants where name = 'カモミール'
on conflict (name) do nothing;

-- ローマンカモミール
insert into public.plants (
  parent_id, name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
)
select
  id, 'ローマンカモミール', 'herb', 'herbaceous',
  0.52, 'moderate', '土の表面が乾いたら／庭植えは基本降雨任せ／夏は朝夕の涼しい時間帯',
  '多年草で寒さに強く踏まれても育つほど丈夫。地上部が枯れても翌年再び芽吹く。夏の高温多湿に弱くプランターは午後の日差しを避ける場所へ。グラウンドカバーとしても利用可。',
  ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-5108/'
from public.plants where name = 'カモミール'
on conflict (name) do nothing;

-- =========================================================
-- 親植物（succulent）
-- =========================================================
-- サボテン・エケベリアは Session 0（anchor）で登録済み。
-- リプサリスは森林性サボテンのため他 succulent と管理が大きく異なる（band 3）。

insert into public.plants (
  name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
) values
  -- band 1（強い乾燥寄り）
  ('アロエ',              'succulent', 'other', 0.13, 'light',
   '表面が乾いてから2〜3日後（冬は月2回程度／通常は月1回目安）',
   '葉に大量の水分を蓄えるため乾燥に極めて強い。水のやり過ぎが最大のリスク。日光を好むが半日陰でも育つ。耐寒性は品種による（キダチアロエは屋外越冬可、アロエベラは霜に弱い）。',
   ARRAY['キダチアロエ', 'アロエベラ'], 'https://www.hyponex.co.jp/plantia/plantia-7775/'),

  ('セダム',              'succulent', 'other', 0.17, 'light',
   '春秋: 2〜3日に1回たっぷり／梅雨〜夏: 雨避け＋回数減／冬: 月1〜4回霧吹き程度',
   '過湿に非常に弱い。梅雨期は特に雨避け必須（特に洋種）。品種によりグラウンドカバーとしても利用可。多肉用の水はけの良い土が必須。',
   ARRAY['マンネングサ'], 'https://www.hyponex.co.jp/plantia/plantia-9176/'),

  ('ハオルチア',           'succulent', 'other', 0.18, 'light',
   '春秋: 表面が乾いたらたっぷり／夏: 10日に1回夕方軽く／冬: 2〜4週に1回',
   '春秋型多肉。他の多肉と異なり直射日光を嫌う（1年を通して明るい日陰）。夏は蒸れ・根腐れ防止で控えめに。冬も休眠期のため控えめ。',
   ARRAY['ハウォルチア'], 'https://www.hyponex.co.jp/plantia/plantia-10556/'),

  ('グラプトペタルム',      'succulent', 'other', 0.18, 'light',
   '春秋: 表面が乾いたらたっぷり／夏: 10日に1回夕方軽く／冬: 2〜4週に1回',
   '屋外で放置気味に育てても増える強健種。極寒の凍結と夏場の蒸れさえ避ければ育てやすい。落ちた葉から容易に増える。',
   ARRAY['朧月', 'オボロヅキ'], 'https://www.kincho-engei.co.jp/cultivation/detail/5685/'),

  -- band 2（乾燥寄り）
  ('カランコエ',           'succulent', 'other', 0.22, 'light',
   '5〜9月: 土が乾いたら／冬: 表面が乾いてから2〜3日待って（10℃以下は4〜5日後）',
   '多肉だが根が細く過湿による根腐れが起きやすい。花もの多肉のため生育期の水管理は他多肉より若干多め。短日植物で開花には日照時間管理が必要。',
   ARRAY['ベニベンケイ'], 'https://www.hyponex.co.jp/plantia/plantia-9110/'),

  -- band 3（森林性サボテン。他の多肉とは全く異なる管理）
  ('リプサリス',           'succulent', 'other', 0.42, 'moderate',
   '表面が乾いて数日後たっぷり／夏は頻度減／冬は月1〜2回＋葉水中心',
   '森林性サボテン。熱帯雨林原産で樹木に着生。空中湿度を好み、乾燥した室内では葉水推奨（ハダニ予防にも有効）。直射日光を嫌い明るい日陰で管理。他の多肉と全く異なる水分管理が必要な点に注意。',
   ARRAY['ヒモサボテン'], 'https://andplants.jp/blogs/magazine/rhipsalis')

on conflict (name) do nothing;

-- =========================================================
-- 親植物（fruit）
-- =========================================================
-- 柑橘は品種差より樹種差の説明性を優先し、レモン・温州みかん・キンカン・ユズを並列に登録。
-- ベリー類は酸性土要求・水分要求の差が大きいため独立して登録。

insert into public.plants (
  name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
) values
  -- band 2（乾燥寄り）
  ('オリーブ',            'fruit', 'tree', 0.35, 'moderate',
   '鉢: 表面が乾いたらたっぷり／夏: 毎日／冬: 控えめ／夏の水やりは午前中に',
   '地中海原産で乾燥に強い。水はけと水もちのバランスが重要。開花期（5〜6月）が梅雨と重なるため受粉不良になりやすく、鉢は軒下推奨。実をつけるには2品種以上混植。夏の午後の水やりは水温上昇で根傷めの原因。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-15832/'),

  -- band 3（標準）
  ('キンカン',            'fruit', 'shrub', 0.48, 'moderate',
   '鉢: 4〜9月 1日1回／10〜12月は乾かし気味／地植えは基本不要',
   '柑橘の中では小柄で鉢栽培に向く。10〜12月の成熟期は乾かし気味の方が果実の色づき・甘みが良い。春〜夏の水切れは落果・落葉の原因。',
   ARRAY['金柑'], 'https://www.kincho-engei.co.jp/cultivation/detail/4626/'),

  ('温州みかん',          'fruit', 'tree', 0.50, 'moderate',
   '鉢: 4〜9月 1日1回／それ以外 表面が乾いたら／地植えは基本不要',
   '耐暑性・耐寒性ともに優れる。花芽〜結実期は水切れ厳禁。地植えは日当たり・水はけ良好で風の当たらない場所。夏の日照りが続いたら地植えでも補水。',
   ARRAY['ウンシュウミカン', 'みかん'], 'https://www.hyponex.co.jp/garden_support/garden_support-120/'),

  ('ユズ',               'fruit', 'tree', 0.50, 'moderate',
   '鉢: 表面が乾いたら底から溢れるまで／地植えは基本不要／収穫前は乾かし気味',
   '他の柑橘より樹勢が強く深根性で枝葉がよく茂る。花・結実まで庭植え7〜8年、鉢植え3〜4年と時間がかかる。カラタチ台木が一般的。収穫前（9月下旬〜）は乾かし気味で果実充実。',
   ARRAY['柚子'], 'https://www.hyponex.co.jp/plantia/plantia-7424/'),

  ('ウメ',               'fruit', 'tree', 0.50, 'moderate',
   '鉢: 表面が乾いたらたっぷり／冬に室内取り込み時は霧吹きで補湿',
   '花梅と実梅がある。実を収穫したい場合は2品種以上を同時栽培推奨。冬に暖房中の室内に入れる場合は霧吹きで枝・幹に補湿。',
   ARRAY['梅'], 'https://www.kincho-engei.co.jp/cultivation/detail/4762/'),

  ('リンゴ',              'fruit', 'tree', 0.50, 'moderate',
   '鉢: 表面が乾き始めたら／夏: 表面が乾いたら鉢底から流れるまで',
   '家庭向けは早生品種（さんさ・祝・つがる等）が豊産性でおすすめ。直射日光・西日は葉焼け・実焼けを起こすためやわらかい日差しの場所へ。受粉樹として異なる品種の混植が必要。',
   ARRAY['林檎'], 'https://www.hyponex.co.jp/plantia/plantia-19997/'),

  ('レモン',              'fruit', 'tree', 0.55, 'moderate',
   '鉢: 表面が乾いたら底から流れるまで／夏: 1日2回／冬: 控えめ',
   '柑橘の中でも水切れに敏感（一度切らすと落葉しやすい）。寒さにやや弱く、寒冷地では鉢植えで屋内越冬が安心。1〜2年に1回植え替え推奨。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-15698/'),

  ('ブラックベリー',       'fruit', 'shrub', 0.55, 'moderate',
   '鉢: 表面が乾いたら鉢底から流れるまで／庭植えは日照時に補水',
   '木イチゴの仲間で病害虫に強く育てやすい。直立性・つる性がある。つる性はフェンス誘引推奨。旺盛に伸びるため冬の剪定必須（前年枝を1/2〜1/3残す）。夏に実がついた枝は枯死するので収穫後根元から剪定。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/garden_support/garden_support-164/'),

  ('イチジク',            'fruit', 'tree', 0.58, 'moderate',
   '鉢: 基本1日1回／夏: 1日2回／冬: 頻度減',
   '果樹の中では水を好む方。夏の直射日光が強すぎると弱るため半日陰か日よけ推奨。早ければ1年目から収穫可能。10号（30cm）以上の鉢が目安。',
   ARRAY['無花果', 'フィグ'], 'https://www.hyponex.co.jp/plantia/plantia-9271/'),

  ('ラズベリー',           'fruit', 'shrub', 0.60, 'moderate',
   '鉢: 4〜7月 1日1回／8〜9月 1日2回／10〜3月 表面が乾いたら',
   '半日陰でも育つ。ベランダ栽培では夏の乾燥に注意。鉢栽培は2年ごとの植え替えが必要（3年超で根詰まり）。水はけの良い土を選ぶ。',
   ARRAY['フランボワーズ', 'キイチゴ'], 'https://www.kincho-engei.co.jp/cultivation/detail/4666/'),

  -- band 4（湿潤寄り・乾燥に極めて弱い）
  ('カキ',               'fruit', 'tree', 0.72, 'heavy',
   '鉢: 5〜9月 朝夕2回／冬: 表面が乾いたら／地植えは活着後は基本不要',
   '鉢栽培では乾燥に極めて弱い。真夏の日中の水やりは水温上昇で根を傷めるため朝夕に。冬でも土が乾燥したら補水。地植えは活着すれば基本不要だが日照りが続いたら補水。',
   ARRAY['柿'], 'https://www.kincho-engei.co.jp/cultivation/detail/4781/'),

  ('ブルーベリー',        'fruit', 'shrub', 0.75, 'heavy',
   '4〜7月: 1日1回／8〜9月: 1日2回／10〜3月: 表面が乾いたら',
   '根が非常に浅く乾燥に極めて弱い。夏の水切れは落葉・収穫量激減の原因。酸性土（pH 4.5程度）を好むためブルーベリー専用土推奨。受粉樹として異なる2品種以上を近くで育てる必要あり。',
   ARRAY[]::text[], 'https://www.kincho-engei.co.jp/cultivation/detail/4771/')

on conflict (name) do nothing;

-- =========================================================
-- 親植物（foliage）
-- =========================================================
-- 観葉植物は乾燥寄り（band 2）〜湿潤寄り（band 4）まで分布する。
-- カラテア・マランタ・アジアンタム・ネフロレピスは高湿度志向で band 4。
-- ザミオクルカス・サンスベリア等は多肉的な乾燥志向で band 2。

insert into public.plants (
  name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
) values
  -- band 2（乾燥寄り）
  ('ザミオクルカス',         'foliage', 'herbaceous', 0.20, 'light',
   '2〜3週に1回（鉢土が完全に乾いてから）／冬はさらに控えめ',
   '東アフリカ乾燥地帯原産のサトイモ科多年草。地中に塊茎を持ち水分を蓄えるため水やりを忘れても枯れにくい。耐陰性が非常に強い。最低10℃以上をキープ。',
   ARRAY['ザミオクルカス・ザミーフォリア', 'ZZプラント'], 'https://andplants.jp/blogs/magazine/zamioculcas'),

  ('サンスベリア',           'foliage', 'herbaceous', 0.22, 'light',
   '春秋: 表面が乾いて2〜3日後／夏: 表面乾いたら株元に／冬: 月1回',
   '葉に水分を蓄えるため乾燥に強い。過湿による根腐れが最大のリスク。風通し重視。冬は休眠期のためほぼ断水。',
   ARRAY['サンセベリア', 'トラノオ'], 'https://www.hyponex.co.jp/plantia/plantia-6915/'),

  ('ペペロミア',            'foliage', 'herbaceous', 0.25, 'light',
   '表面が乾いてから数日あけて／冬は特に控えめ',
   '葉や茎に水分を保有するため水やりは控えめ。定期的な葉水は推奨。明るい日陰を好み耐陰性あり。最低10℃キープ。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-14478/'),

  ('ハートカズラ',           'foliage', 'vine', 0.27, 'light',
   '土の表面が乾いて完全に乾燥してから／葉水はこまめに',
   '半多肉性のつる植物。厚い葉に水分を蓄えるため水やりは控えめが基本。過湿は根腐れの原因。ハンギング向き。',
   ARRAY['ラブチェーン', 'セロペギア・ウッディ'], 'https://www.hyponex.co.jp/plantia/plantia-7214/'),

  ('ホヤ',                 'foliage', 'vine', 0.28, 'light',
   '表面が乾いてから／年間通してやや乾かし気味',
   '過湿による根腐れが枯死の最大要因。葉水で空中湿度を保つ。花を咲かせるにはつるを長く伸ばして日照確保が必要。',
   ARRAY['サクララン'], 'https://www.hyponex.co.jp/plantia/22725/'),

  ('ドラセナ',              'foliage', 'tree', 0.30, 'light',
   '春: 表面乾いたら／夏: 毎日／冬: 土が乾いて2〜3日後',
   '乾燥に強くやや乾燥気味を好む。土の表面が白くなってから水やりが目安。直射日光は葉焼けの原因。2年に1回植え替え。',
   ARRAY['幸福の木', 'マッサン'], 'https://www.hyponex.co.jp/plantia/plantia-7119/'),

  ('ガジュマル',            'foliage', 'tree', 0.35, 'light',
   '春秋: 表面乾いたらたっぷり／冬: 表面乾燥から2〜3日後',
   '幸せを呼ぶ木として人気。丈夫で育てやすく初心者向け。夏の直射日光は葉焼けの原因。冬は5℃以上をキープ。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-6900/'),

  ('パキラ',                'foliage', 'tree', 0.35, 'light',
   '春夏: 表面乾いたら鉢底から流れるまで／秋冬: 土中が乾いて2〜3日後',
   '枯れる原因の多くは水のやりすぎ。受け皿の水は必ず捨てる。耐陰性あるが日光不足だと弱る。葉水推奨。',
   ARRAY['発財樹'], 'https://www.hyponex.co.jp/plantia/plantia-6975/'),

  ('アイビー',              'foliage', 'vine', 0.40, 'moderate',
   '春秋: 表面乾いたらたっぷり／冬: 控えめ／地植えは基本不要',
   '非常に丈夫で初心者向け。耐陰性強く北側でも育つが徒長・斑消失に注意。斑入りは強日照で葉焼け。',
   ARRAY['ヘデラ'], 'https://www.hyponex.co.jp/garden_support/garden_support-276/'),

  -- band 3（標準）
  ('ポトス',                'foliage', 'vine', 0.45, 'moderate',
   '冬以外: 表面乾いたら鉢底から流れるまで／冬: 乾かし気味',
   '初心者向けの代表格。耐陰性ありだが日照不足で斑が消える。夏は早朝か夕方に水やり。年間通じて葉水推奨。',
   ARRAY['ゴールデンポトス', 'エピプレナム'], 'https://www.hyponex.co.jp/plantia/plantia-14463/'),

  ('シェフレラ',            'foliage', 'tree', 0.45, 'moderate',
   '春夏: 表面乾いたら鉢底から流れるまで／秋冬: 表面乾いて2〜3日後',
   '日当たり・温度・湿度をあまり選ばず育てやすい代表種。毎日水をやると根腐れの原因。40℃超の直射日光は避ける。',
   ARRAY['カポック', 'ホンコンカポック'], 'https://www.hyponex.co.jp/plantia/plantia-14376/'),

  ('オリヅルラン',           'foliage', 'herbaceous', 0.45, 'moderate',
   '表面乾いてからたっぷり／冬: 表面乾燥から3日後',
   '耐寒性が観葉としては強く（5℃）、関東以西は屋外越冬可。明るい日陰〜遮光下を好む。日照不足で徒長。',
   ARRAY['折鶴蘭'], 'https://www.hyponex.co.jp/plantia/plantia-14389/'),

  ('モンステラ',            'foliage', 'vine', 0.50, 'moderate',
   '冬以外: 表面乾いたら鉢底から流れるまで／冬: 乾かし気味',
   '高温多湿に強い。夏は早朝の水やりが基本。直射日光は葉焼け、レースカーテン越しが理想。ハダニ予防に葉水こまめに。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-11257/'),

  ('フィカス・ウンベラータ',   'foliage', 'tree', 0.50, 'moderate',
   '春秋: 表面乾いたらたっぷり／夏: 水切れ注意／冬: 乾かし気味',
   '成長が早く 1〜2年に1回植え替え必須。18〜30℃で最も成長。カーテン越しの窓辺が理想。',
   ARRAY['ウンベラータ'], 'https://www.hyponex.co.jp/plantia/plantia-16978/'),

  ('フィカス・ベンジャミナ',   'foliage', 'tree', 0.50, 'moderate',
   '春秋: 表面乾いたらたっぷり／冬: 乾かし気味',
   '環境変化に敏感で葉を落としやすい。設置場所は固定推奨。耐寒性弱く冬は室内。定期的な葉水推奨。',
   ARRAY['ベンジャミン', 'ベンジャミンゴム'], 'https://www.hyponex.co.jp/plantia/plantia-13750/'),

  ('アグラオネマ',           'foliage', 'herbaceous', 0.50, 'moderate',
   '春秋: 表面乾いたらたっぷり／冬: 乾き気味＋軽く霧吹き',
   '高温多湿を好むが常時湿った状態はNG（少し乾き始めてからたっぷり）。耐陰性強い。葉水推奨。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-20273/'),

  ('クワズイモ',            'foliage', 'herbaceous', 0.50, 'moderate',
   '春秋: 表面が乾いてきたらたっぷり／冬: 表面完全に乾いてから',
   '湿度好むが常時湿った土は根腐れの原因。冬は霧吹きや葉拭きで湿度確保。樹液にシュウ酸を含み肌荒れに注意。',
   ARRAY[]::text[], 'https://www.kincho-engei.co.jp/cultivation/detail/5236/'),

  ('クロトン',              'foliage', 'shrub', 0.55, 'moderate',
   '春秋: 表面が乾き始めたら／冬: 表面乾いて2〜3日後',
   '鮮やかな葉色をキープするには乾燥を防ぎ葉水推奨。日光不足で葉色が褪せる。耐寒性弱く最低10℃キープ。',
   ARRAY['ヘンヨウボク'], 'https://www.hyponex.co.jp/plantia/plantia-14549/'),

  ('コルジリネ',            'foliage', 'tree', 0.55, 'moderate',
   '4〜10月: 表面乾いたら鉢底から流れるまで（7〜9月はほぼ毎日）／11〜3月: 週1〜2',
   '生育旺盛な夏はほぼ毎日水やり。耐寒性弱く冬は5〜10℃をキープ。水はけの良い用土必須。',
   ARRAY['コルディリネ'], 'https://www.hyponex.co.jp/plantia/plantia-16213/'),

  ('テーブルヤシ',           'foliage', 'tree', 0.55, 'moderate',
   '冬以外: 表面乾いたら鉢底から流れるまで／冬: 週1回程度',
   '中南米原産の小型ヤシで耐陰性あり。多湿を好むため葉水は毎日推奨。夏は早朝か夕方に水やり。',
   ARRAY['チャメドレア'], 'https://www.hyponex.co.jp/plantia/plantia-14211/'),

  ('アレカヤシ',            'foliage', 'tree', 0.58, 'moderate',
   '春秋: 表面が乾く前にたっぷり（葉先が茶色くなる）／冬: 完全に乾いてから',
   '熱帯・亜熱帯性。乾燥すると葉先が茶色くなる。ヤシの中では寒さに弱く冬は室内。強い直射日光を嫌う。葉水推奨。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/garden_support/garden_support-269/'),

  -- band 4（湿潤寄り）
  ('ネフロレピス',           'foliage', 'herbaceous', 0.65, 'moderate',
   '春秋: 表面が乾く前にたっぷり／冬: 乾かし気味＋葉水こまめ',
   'シダ類で高温多湿を好む。夏の直射日光は葉焼け、遮光か半日陰で管理。冬でも空気乾燥を嫌い葉水必須。',
   ARRAY['タマシダ'], 'https://www.hyponex.co.jp/garden_support/garden_support-200/'),

  ('マランタ',              'foliage', 'herbaceous', 0.68, 'moderate',
   '春秋: 表面乾いたらたっぷり／夏: ほぼ毎日／冬: 表面乾いて数日後',
   '湿度大好き（乾燥で葉がくるまる）。空気湿度不足時は葉水必須。夜に葉が立ち上がる就眠運動（プレイヤープラントの由来）。',
   ARRAY['プレイヤープラント'], 'https://www.shuminoengei.jp/m-pc/a-page_p_detail/target_plant_code-468/target_tab-2'),

  ('カラテア',              'foliage', 'herbaceous', 0.68, 'moderate',
   '春秋: 表面がうっすら乾いたらたっぷり／夏: 朝夕1日2回／冬: 乾かし気味＋葉水こまめ',
   '高温多湿を好み水不足で葉が丸まる。強日射で葉焼け、明るい日陰が理想。葉の模様が魅力の代表種。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-11653/'),

  ('アジアンタム',           'foliage', 'herbaceous', 0.72, 'moderate',
   '常時湿度高めキープ／こまめな葉水必須／エアコン風は避ける',
   'シダの中でも乾燥に極めて弱い。葉がチリチリになりやすいため葉水頻度が最重要。直射日光NG、明るい日陰。',
   ARRAY['ホウライシダ'], 'https://www.hyponex.co.jp/plantia/plantia-9714/')

on conflict (name) do nothing;

-- =========================================================
-- 親植物（flower）
-- =========================================================
-- 花もの category は band 2〜band 4 に幅広く分布。
-- アジサイ・ゼラニウムは Session 0（anchor）で登録済み。

insert into public.plants (
  name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
) values
  -- band 2（乾燥寄り）
  ('千日紅',                'flower', 'herbaceous', 0.28, 'light',
   '鉢: 表面乾いたらたっぷり／地植え: 降雨任せ／夏は朝夕1回',
   '暑さ・乾燥に強く長期間楽しめる。過湿に弱く肥料も与えすぎ注意。',
   ARRAY['センニチコウ', 'ゴンフレナ'], 'https://www.hyponex.co.jp/plantia/6024/'),

  ('カーネーション',         'flower', 'herbaceous', 0.30, 'light',
   '表面乾燥してさらさらしてから鉢底から流れるまで／冬: 完全乾燥から2〜3日後',
   '水やりすぎで根腐れ。花蕾に水がかかると病気やカビ。朝夕の涼しい時間帯に。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-14782/'),

  ('ラナンキュラス',         'flower', 'herbaceous', 0.30, 'light',
   '乾燥気味／表面乾いたら／植えつけ直後は4〜5日水やらない',
   '球根植物。加湿は球根腐りの原因。花びらは繊細で水がかかると傷む。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-7234/'),

  ('コスモス',              'flower', 'herbaceous', 0.32, 'light',
   '鉢: 表面乾燥後たっぷり／地植え: 降雨任せ',
   '湿度高く暗い場所は苦手。肥料水与えすぎで倒れやすくなる。日当たり風通し良好が必須。',
   ARRAY['秋桜'], 'https://www.hyponex.co.jp/plantia/plantia-15193/'),

  ('ベゴニア',              'flower', 'herbaceous', 0.35, 'light',
   '表面乾いてからたっぷり／冬: 乾いてから数日後',
   '多湿苦手で水やりすぎで根腐れ。葉に水かけると傷み・病気。株元にそっと。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-7354/'),

  ('ガーベラ',              'flower', 'herbaceous', 0.35, 'light',
   '鉢: 表面乾いてから鉢底から流れるまで／地植え: 基本不要',
   '過湿苦手で根腐れリスク。葉間に水たまると蒸れ・病気。株元へ与える。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-7245/'),

  -- band 3（標準）
  ('パンジー',              'flower', 'herbaceous', 0.42, 'moderate',
   '表面乾いたらたっぷり／冬は午前中に',
   '多湿嫌い。冬は午後の水やりで凍結リスク。日当たり風通し重要。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-9630/'),

  ('ビオラ',                'flower', 'herbaceous', 0.42, 'moderate',
   '表面乾いたらたっぷり／冬は午前中に',
   'パンジーとほぼ同管理。株が小型で開花期はより長い。日当たり重要。冬季戸外可。',
   ARRAY[]::text[], 'https://www.kincho-engei.co.jp/cultivation/detail/5185/'),

  ('マリーゴールド',         'flower', 'herbaceous', 0.42, 'moderate',
   '表面乾いたらたっぷり／地植え: 降雨任せ／夏は朝たっぷり',
   '水はけの良い土を好む。日照不足で徒長・花つき悪化。よく根が張り丈夫。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-8206/'),

  ('ジニア',                'flower', 'herbaceous', 0.42, 'moderate',
   '鉢: 表面乾いてから／地植え: 降雨任せ／夏は朝夕2回も',
   '過湿嫌い、常時湿った土は避ける。水切れは花色悪化。日光重要。',
   ARRAY['百日草', 'ヒャクニチソウ'], 'https://www.hyponex.co.jp/plantia/study/3525'),

  ('クリスマスローズ',        'flower', 'herbaceous', 0.42, 'moderate',
   '10〜5月: 表面乾いてからたっぷり／6〜9月: 乾かし気味／地植えは基本不要',
   '過湿嫌う。夏は休眠期で完全に乾かし気味に。冬は午前中の水やりで霜対策。多年草で耐寒性強い。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-6789/'),

  ('ペチュニア',             'flower', 'herbaceous', 0.48, 'moderate',
   '鉢: 表面乾いたら鉢底から流れるまで／地植え: 乾燥時のみ／夏は朝夕に',
   '乾燥嫌う。花に水かけない。雨で花傷むため軒下推奨。日当たり必須。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-8181/'),

  ('サフィニア',             'flower', 'herbaceous', 0.48, 'moderate',
   '鉢: 表面乾いたらたっぷり／夏は朝夕に',
   'ペチュニアの改良品種。管理はペチュニア準拠。肥料食い（大食いと呼ばれる）。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-14310/'),

  ('サザンカ',              'flower', 'shrub', 0.50, 'moderate',
   '植えつけから2年: たっぷり／根付き後鉢: 表面乾いたら／地植え: 降雨任せ',
   '開花期は水切らさない。水はけ良く有機物多い土を好む。剪定は3〜4月。',
   ARRAY['山茶花'], 'https://www.hyponex.co.jp/plantia/plantia-7434/'),

  ('キンモクセイ',           'flower', 'tree', 0.50, 'moderate',
   '地植え: 基本不要／鉢: 土乾いたら／夏は水切れ注意（花芽形成期）',
   '夏の水切れは秋の開花不良の原因。水はけ良く栄養ある土を好む。剪定は早春（2〜4月）。',
   ARRAY['金木犀'], 'https://www.hyponex.co.jp/plantia/plantia-13813/'),

  ('バラ',                  'flower', 'shrub', 0.55, 'moderate',
   '鉢: 春秋1日1回、真夏朝夕2回／冬: 土乾いたら朝に',
   '生育旺盛な春〜初夏は水切れ注意。水やりすぎで根腐れも。適切な鉢サイズ（6〜7号から）で徐々に大きく。',
   ARRAY['ローズ'], 'https://www.hyponex.co.jp/plantia/plantia-14290/'),

  ('ダリア',                'flower', 'herbaceous', 0.55, 'moderate',
   '鉢: 表面乾いたら鉢底から流れるまで／地植え: 極度乾燥時のみ／夏は朝夕',
   '球根植物。常時湿状態は球根腐りの原因。植えつけ後は発芽まで水やらない。次々開花で追肥重要。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-15355/'),

  ('サルビア',              'flower', 'herbaceous', 0.55, 'moderate',
   '表面が乾き始めたらたっぷり／早朝に',
   '水枯れに弱く水足りないと下葉が枯れる。過湿も根腐れ原因。夏の強日光・西日は苦手。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-8527/'),

  ('ケイトウ',              'flower', 'herbaceous', 0.55, 'moderate',
   '毎日たっぷり／夏は朝夕2回／苗育成期は乾燥させない',
   '苗育成期は乾燥厳禁。過湿による根腐れも注意。日光要求性高い。',
   ARRAY['鶏頭'], 'https://www.hyponex.co.jp/plantia/plantia-13856/'),

  ('シクラメン',             'flower', 'herbaceous', 0.55, 'moderate',
   '底面給水: 鉢皿の水切らさない／通常鉢: 土に静かに注ぐ／花や球根に直接NG',
   '底面給水鉢が主流。2週に1度は上から給水し老廃物流す。花・球根上部への水は病気の原因。9〜5月開花期は肥料週1。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-7363/'),

  ('ツバキ',                'flower', 'tree', 0.55, 'moderate',
   '鉢夏: 朝夕毎日／春秋: 1〜2日に1回／冬: 土乾いたら／地植え: 猛暑時のみ',
   '乾燥・強い西日で葉焼け。水はけ良く有機物多い酸性土を好む。冬は蕾・枝を寒風から守る。',
   ARRAY['椿'], 'https://www.hyponex.co.jp/plantia/plantia-13816/'),

  ('チューリップ',           'flower', 'herbaceous', 0.55, 'moderate',
   '植えつけ時: たっぷり／発芽後: 土乾いたら十分に／花後: 葉が枯れるまで継続',
   '秋植え春咲きの球根。過湿嫌うが水も好む。植えつけ時に球根の向きを揃える（平らな面を外向き）。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-9072/'),

  ('ヒマワリ',              'flower', 'herbaceous', 0.60, 'moderate',
   '発芽〜生育初期: 乾燥させない／開花期は朝晩2回たっぷり',
   '根が浅く乾燥がすぐ影響する。株元に敷きワラ推奨。日当たり必須で日照不足だと徒長。',
   ARRAY['向日葵'], 'https://www.hyponex.co.jp/plantia/plantia-13403/'),

  ('インパチェンス',          'flower', 'herbaceous', 0.60, 'moderate',
   '鉢: 表面乾き始めたらたっぷり／夏は朝夕1回ずつ／地植えは乾燥時のみ',
   '乾燥苦手で水切れ注意。花に水かけると病気の原因。半日陰でも育つ。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/garden_support/garden_support-265/'),

  ('サツキ',                'flower', 'shrub', 0.60, 'moderate',
   '鉢夏: 朝夕2回鉢底から流れるまで／それ以外: 土乾く前に／地植え: 降雨任せ',
   '乾燥に弱く川辺自生の湿潤好み。水もち＋水はけの土を好む。真夏の直射日光は避ける。',
   ARRAY['皐月'], 'https://www.hyponex.co.jp/plantia/plantia-15471/'),

  -- band 4（湿潤寄り）
  ('朝顔',                  'flower', 'vine', 0.65, 'moderate',
   '開花期: 毎日朝晩たっぷり／発芽期: 乾燥させない',
   '乾燥で花つき悪化、水切れ厳禁。ただし過湿も根腐れ。朝夕の涼しい時間帯に。日照必須（不足でつるばかり伸びる）。',
   ARRAY['アサガオ'], 'https://www.hyponex.co.jp/plantia/plantia-6374/')

on conflict (name) do nothing;

-- =========================================================
-- 親植物（vegetable）
-- =========================================================
-- 野菜は栽培期間が限定的（一年生中心）で生育ステージにより水管理が変わる。
-- 実物野菜（トマト・ナス・キュウリ等）と葉野菜（ホウレンソウ等）と根菜（ジャガイモ等）で管理が大きく異なる。

insert into public.plants (
  name, plant_category, growth_form,
  preferred_moisture_level, watering_amount, watering_pace, watering_notes,
  aliases, reference_url
) values
  -- band 2（乾燥寄り）
  ('ジャガイモ',            'vegetable', 'herbaceous', 0.28, 'light',
   '地植え: 基本不要／プランター: 前期は乾いたら、後期は乾き気味／芽出しまで水やり不要',
   '乾き気味の土を好む。水与えすぎで腐りやすい。芽が出た後は表土白っぽく乾いたら水やり。芽かき・土寄せが成功のポイント。',
   ARRAY['じゃがいも', '馬鈴薯'], 'https://www.hyponex.co.jp/plantia/7303/'),

  ('サツマイモ',            'vegetable', 'vine', 0.28, 'light',
   '植えつけ直後1週間: たっぷり／以降: 基本不要（乾燥時のみ）',
   '過湿嫌う。植えつけ後は基本水やり不要。葉がしおれたらたっぷり。つる返し（地上のつるから根が生えないように）が管理のコツ。',
   ARRAY['さつまいも', 'かんしょ'], 'https://www.hyponex.co.jp/plantia/plantia-10115/'),

  ('ネギ',                 'vegetable', 'herbaceous', 0.30, 'light',
   '発芽まで: 乾かさない／発芽後: 基本水やり不要（極端な乾燥時のみ）',
   '発芽後は極端に乾燥するとき以外水やり不要。葉がぐったりしおれない限り水やり不要。土寄せが植えつけ後2〜3週から複数回必要。',
   ARRAY['長ネギ', '葉ネギ'], 'https://www.hyponex.co.jp/plantia/plantia-13738/'),

  ('タマネギ',             'vegetable', 'herbaceous', 0.35, 'light',
   '植えつけ後たっぷり／少々乾燥気味に／冬越し後: 土が乾き過ぎないよう毎日',
   '多湿に弱い。冬に長晴天時は昼間の水やりで凍結防止。「浅植え」が基本。',
   ARRAY['玉ねぎ'], 'https://www.hyponex.co.jp/plantia/plantia-5665/'),

  -- band 3（標準）
  ('トマト',               'vegetable', 'herbaceous', 0.42, 'moderate',
   '実がなるまで: 控えめ／実がなり始め: 十分に／色づいたら: 控えめ／朝に',
   '「肥料過多より水分過多に注意」。露地は基本降雨任せ、毎日たっぷりは根が浅くなり弱い株に。プランターは底から流れるまで。梅雨は軒下推奨。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-8231/'),

  ('ミニトマト',            'vegetable', 'herbaceous', 0.42, 'moderate',
   '実がなるまで: 控えめ／実がなり始め: 十分に／色づいたら: やや控えめ／朝に',
   '通常のトマトと同管理。梅雨は軒下推奨。色づき始めたら水控えめで甘さアップ。プランター栽培に向く。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-14423/'),

  ('ホウレンソウ',           'vegetable', 'herbaceous', 0.42, 'moderate',
   '発芽まで: 乾燥させない／以降: 表面乾いたら／冬: 控えめ午前中に',
   '冷涼な気候好み、暑さ苦手で秋まき冬採りが基本。酸性土に弱く苦土石灰で中和。生長早く1〜2ヶ月で収穫。',
   ARRAY['法蓮草'], 'https://www.hyponex.co.jp/plantia/plantia-9258/'),

  ('レタス',               'vegetable', 'herbaceous', 0.45, 'moderate',
   '土乾いたら／水切れ注意／過湿は根腐れ',
   '十分な水必要だが多湿に弱い。梅雨時は雨よけ推奨。植えつけ時期は春秋。約2〜3ヶ月で収穫。外葉から順次収穫可。',
   ARRAY['リーフレタス'], 'https://www.hyponex.co.jp/plantia/plantia-10064/'),

  ('キャベツ',             'vegetable', 'herbaceous', 0.45, 'moderate',
   '発芽まで: たっぷり／以降: 表面乾いたらたっぷり／結球期: 加湿に注意',
   '過湿嫌い、水はけの良い土を好む。結球期に加湿すると球が中心から割れやすい。深く根を張る。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-6594/'),

  ('ブロッコリー',           'vegetable', 'herbaceous', 0.45, 'moderate',
   '植えつけ後1週間: 乾燥させすぎない／以降: 表面乾いたら株元にたっぷり',
   '過湿・湿害に弱い。水はけ良い状態が必須。地植えは畝を高く。冷涼気候（15〜20℃）が生育適温。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-9102/'),

  ('ダイコン',             'vegetable', 'herbaceous', 0.48, 'moderate',
   '発芽まで: 乾かさない／以降: 表面乾いたらたっぷり／根肥大期: 水切れ厳禁',
   '根肥大時に水不足だと根が破裂する。冷涼気候好み。通気性・保水性・排水性のバランスが良い土が理想。',
   ARRAY['大根'], 'https://www.hyponex.co.jp/plantia/plantia-13174/'),

  ('ニンジン',             'vegetable', 'herbaceous', 0.48, 'moderate',
   '発芽まで: 乾燥厳禁でこまめに／発芽後: 表面乾いたら',
   '種は極小で発芽まで水分管理が最重要。ジョウロで優しく散水（勢いよいと種流れる）。土をかけすぎ厳禁（日光不足で発芽しない）。',
   ARRAY['人参'], 'https://www.hyponex.co.jp/plantia/plantia-13544/'),

  ('コマツナ',             'vegetable', 'herbaceous', 0.50, 'moderate',
   '発芽まで: 乾かさない／以降: 1日1回、夏は朝夕2回',
   '種まきから1ヶ月で収穫可能な速成野菜。関東以西は3〜10月が種まき適期。虫よけに不織布かぶせ推奨。',
   ARRAY['小松菜'], 'https://www.hyponex.co.jp/plantia/plantia-13794/'),

  ('ピーマン',             'vegetable', 'herbaceous', 0.50, 'moderate',
   '植えつけ後1週間: 毎日たっぷり／以降: 表面乾いたらたっぷり／夏: 朝夕2回も',
   '過湿にも弱く根腐れ注意。4〜6月は1〜3日に1回、7〜8月中旬は1〜4日に1〜2回。高温乾燥期の水切れ注意。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-11292/'),

  ('パプリカ',             'vegetable', 'herbaceous', 0.55, 'moderate',
   '植えつけ直後: 控えめ／株生長後: 表面乾いたらたっぷり／夏は朝夕',
   '水分をたくさん必要とする。水不足で株勢弱まり実つき悪化。ピーマンより繊細で栽培難易度高い。着色まで長期間必要。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-15007/'),

  -- band 4（湿潤寄り）
  ('キュウリ',             'vegetable', 'vine', 0.68, 'moderate',
   '5〜6月: 1日1回／7〜9月中旬: 1日1〜2回／夏場は朝夕2回も',
   '根が浅く広く張り過湿・乾燥ともに弱い。水分と肥料多く必要。不足で実が曲がり大きくならない。排水性・通気性重視。',
   ARRAY[]::text[], 'https://www.hyponex.co.jp/plantia/plantia-10303/'),

  ('ナス',                 'vegetable', 'herbaceous', 0.72, 'heavy',
   '5〜6月: 1日1回／7〜9月中旬: 1日1〜2回／夏朝夕2回／梅雨明け以降は水多いほど良い',
   '「ナスは水で作る」と言われるほど水好み。水不足で株弱り花・実つき悪化。株元にワラ・マルチで乾燥対策。高温多湿に強く育てやすい。',
   ARRAY['茄子'], 'https://www.hyponex.co.jp/plantia/plantia-13026/')

on conflict (name) do nothing;

commit;
