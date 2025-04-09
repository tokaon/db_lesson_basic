Q1
CREATE TABLE
  `departments`
  (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_id TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_id TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );


Q2
ALTER TABLE
  people
ADD
  department_id INT UNSIGNED
  AFTER
    email;


Q3
INSERT INTO
  departments
  (name)
VALUES
  ('営業'),
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');

INSERT INTO
  people
  (
    name,
    email,
    department_id,
    age,
    gender
  )
VALUES
  ('一川ゆうた', '1kawa@gizumo.jp', 1, 45, 1),
  ('二科みか', '2sina@gizumo.jp', 2, 29, 2),
  ('三島だいち', 'misima@gizumo.jp', 2, 33, 1),
  ('四条まさや', '4jyou@gizumo.jp', 3, 37, 1),
  ('五反田ひかり', 'gotanda@gizumo.jp', 1, 28, 2),
  ('六本木ゆきこ', 'ropongi@gizumo.jp', 5, 35, 2),
  ('七瀬こたろう', '7se@gizumo.jp', 2, 25, 1),
  ('八戸たすく', 'hachinohe@gizumo.jp', 1, 27, 1),
  ('九重りょう', 'kokonoe@gizumo.jp', 4, 34, 1),
  ('十文字さや', '10monji@gizumo.jp', 2, 41, 2);

INSERT INTO
  reports
  (
    person_id,
    content
  )
VALUES
  (9, 'あめんぼ赤いなあいうえお'),
  (8, 'どこで生れたかとんと見当がつかぬ。'),
  (12, '掌の上で少し落ちついて書生の顔を見た'),
  (10, '時々ぷうぷうと煙を吹く'),
  (11, 'アカシヤを植え込んだ広い地面'),
  (15, 'クジラは海面に跳ねあがった'),
  (13, '彼はそれを月が綺麗ですねと訳した'),
  (14, '桜の樹の下には屍体が眠っているらしい'),
  (16, 'その店には珍しい檸檬が出ていた'),
  (17, '智に働けば角が立つ、と。');


Q4
UPDATE
  people
SET
  department_id = 3
WHERE
  department_id IS NULL
  AND
  age < 30;

UPDATE
  people
SET
  department_id = 4
WHERE
  department_id IS NULL
  AND
  age > 30;

UPDATE
  people
SET
  department_id = 5
WHERE
  gender IS NULL;


Q5
SELECT
  name, age
FROM
  people
WHERE
  gender = 1
ORDER BY
  age
  DESC;


Q6
peopleテーブルの中から部署IDのカラムが１の人の名前とメールアドレスと年齢のレコードを取得してデータ作成日時が昇順になるように表示。


Q7
SELECT
  name
FROM
  people
WHERE
  (
    20 <= age
    AND
    age < 30
    AND
    gender = 2
  )
  OR
  (
    40 <= age
    AND
    age < 50
    AND
    gender = 1
  );


Q8
SELECT
  *
FROM
  people
WHERE
  department_id = 1
ORDER BY
  age
  ASC;


Q9
SELECT
  AVG(age)
  AS average_age
FROM
  people
WHERE
  department_id = 2
  AND
    gender = 2;


Q10
SELECT
  d.name, p.name, r.content
FROM
  departments d
INNER JOIN
  people p
  ON
  d.department_id = p.department_id
INNER JOIN
  reports r
  ON
  p.person_id = r.person_id;


Q11
SELECT
  p.name
FROM
  people p
LEFT OUTER JOIN
  reports r
  USING(person_id)
WHERE
  r.person_id IS NULL;
