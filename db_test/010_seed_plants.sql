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
--   [x] Session 1: herb + orchid（一部未確定植物あり → docs/seed_research/ 参照）
--   [ ] Session 2: succulent + fruit
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
   ARRAY['ペパーミント', 'スペアミント', 'アップルミント'], 'https://www.hyponex.co.jp/garden_support/garden_support-127/')

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

-- フレンチラベンダー・ラバンジン・レースラベンダーは調査完了後に追加予定
-- docs/seed_research/herb.md の該当セクションを参照

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

-- ローマンカモミールは調査完了後に追加予定

commit;
