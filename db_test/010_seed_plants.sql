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
--   [ ] Session 3: foliage
--   [ ] Session 4: flower
--   [ ] Session 5: vegetable

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

commit;
