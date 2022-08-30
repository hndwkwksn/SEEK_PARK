# <SEEK_PARK>

## サイト概要
### サイトテーマ
自分の好きな公園を見つけたい人が集まるSNSサイト

### テーマを選んだ理由
公園は老若男女問わず利用出来る場所です。そして利用の理由も人によって様々です。
今の日本では全国で１０万個近くの公園が存在しています。多種多様な公園も知られて、利用されなければ意味がありません。
私自身も引越し先で周りの地理も何も分からない時に「ランニング出来る公園はないかな？」と地図アプリを使って調べたりしました。
ですが、場所は分かっても自分の考えている利用方法に適した公園かまでは分からない事が多い気がします。

まずは知る事から始めようと思い、これまであまり発信されていなかった公園にフォーカスしました。
楽しく安心して公園を利用する為、公園の情報をみんなで作っていく為に SEEK_PARKを開発しようと考えました。

### ターゲットユーザ
- 利用目的に合った公園を探したい人
- 公園が好きな人
- 自分の好きな公園を共有したい又は見つけたい人

### 主な利用シーン
- 他人の投稿した公園の情報を見たいとき
- 自分の好きな公園を共有したいとき
- 利用目的に合った公園を探したいとき

## 設計書
### UIflow
- エンド
![エンド側_uiflows(SEEK_PARK)](https://user-images.githubusercontent.com/105696893/184519603-12e28eef-398d-4054-ae8c-014c191d0d2d.png)
- 管理者
https://drive.google.com/file/d/1bWcC-Envo0Ix-7YIvxiIXRrXkOfvoowA/view?usp=sharing
***
- テーブル定義書
https://drive.google.com/file/d/1p3MBUy96ZXPVlSkhAib7I_-LHXeNTdyV/view?usp=sharing
***
## ER図
![ER図_SEEK_PARK](https://user-images.githubusercontent.com/105696893/186155438-426a564a-d42a-4da9-b140-fa0969d22f87.png)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 実装機能
ユーザー管理機能(Gemのdeviseを使用)</br>
![sign_up](https://user-images.githubusercontent.com/105696893/187426832-2a302446-c25a-447c-adf2-49bcac4e693b.gif)

投稿機能(投稿詳細・編集・削除)</br>
![new_post](https://user-images.githubusercontent.com/105696893/187430200-eb253bd7-1dc2-49fa-8149-6d18022783cf.gif)

いいね・コメント機能</br>
![favorite comment](https://user-images.githubusercontent.com/105696893/187431166-e4609edf-b3e7-436b-aa67-38c7354fc894.gif)

フォロー機能</br>
![follow](https://user-images.githubusercontent.com/105696893/187432373-80c1232b-c1ac-474a-aad5-a7b1b9e469c6.gif)

相互フォローでのダイレクトメッセージ機能</br>
![DM](https://user-images.githubusercontent.com/105696893/187433158-565697ae-0b65-43a2-bceb-665c5844f8aa.gif)

スマホ対応!</br>
![responsive](https://user-images.githubusercontent.com/105696893/187434307-97511a26-f016-4e4a-8957-ed242781f97e.gif)

ダークモード対応!</br>
![dark_mode](https://user-images.githubusercontent.com/105696893/187435171-0a2ede50-6e03-423d-baa4-5c2a0b98e33b.gif)

## 使用素材
<a href="https://pixabay.com/ja/users/pepperminting-633504/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=560435">Pepper Mint</a>による<a href="https://pixabay.com/ja//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=560435">Pixabay</a>からの画像<br />
<a href="https://pixabay.com/ja/users/mabelamber-1377835/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3596034">👀 Mabel Amber, who will one day</a>による<a href="https://pixabay.com/ja//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3596034">Pixabay</a>からの画像<br />
<a href="https://pixabay.com/ja/users/pixel2013-2364555/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3731094">S. Hermann &amp;amp; F. Richter</a>による<a href="https://pixabay.com/ja//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3731094">Pixabay</a>からの画像<br />
<a href="https://pixabay.com/ja/users/arcaion-2057886/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3116883">Henryk Niestrój</a>による<a href="https://pixabay.com/ja//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3116883">Pixabay</a>からの画像<br />
<a href="https://pixabay.com/ja/users/vinnyciro-219264/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=616319">Vincent Ciro</a>による<a href="https://pixabay.com/ja//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=616319">Pixabay</a>からの画像<br />
