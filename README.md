# プロジェクト名「Cat Food Mate」
![ogp](https://github.com/user-attachments/assets/e6fcf627-2889-4b78-a3f4-a96dd162a5e7)

# ■目次
- [サービス概要](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
- [サービスURL](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
- [サービス開発の背景](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
- [機能紹介](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
  - [ユーザー登録なしで利用できる機能](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
  - [ユーザー登録後に利用できる機能](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
- [サービスの差別化ポイント](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
- [技術構成について](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
  - [使用技術](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
  - [画面遷移図](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)
  - [ER図](https://github.com/abusumi/cat-project/edit/main/README.md#%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%A6%82%E8%A6%81)

# ■サービス概要
~ あなたの猫にぴったりの食事量を簡単に計算 ~  
Cat Food Mateは猫の1日の必要給与量を簡単に計算してくれるサービスです。
体重変化が大きい時期の給与量計算や新しいフード購入時の給与量計算の手助けをを行ってくれるアプリです。
実際に使用したフードの評価やレビューを共有しフードの情報交換を行えます。また、愛猫やペットのプロフィールを投稿してみんなに紹介。他のユーザーとシェアできます。

# ■ サービスURL
***https://catfood-mate.com***

# ■ このサービス開発の背景
去年、今年と子猫をお迎えしましたが日々移り変わる体重、フードに対し給与計算が煩わしく感じていました。我が家では生後1〜３ヶ月、４ヶ月〜一歳、一歳以降でフードのメーカー、種類が違ったため都度計算し直していました。体重が増えるとまた計算し直し。また猫の状態次第で普段とは違うフードをあげることもあるため計算してくれるアプリが欲しいと思ったのがきっかけです。
中には食べてくれるフードを模索している、猫を頻繁に預かっているなど諸事情で頻繁にフードを変える家庭もあるかと思います。そんな方への手助けになるアプリを作りたいと思ったことがきっかけです。

# ■機能紹介
## ⚫︎ユーザー登録なしで利用できる機能
| 給与量の計算 |
|---|
|![1](https://github.com/user-attachments/assets/5850f038-0cd2-469c-979d-592c9fd1a55a)|
| トップページの「給与量の計算」ボタンまたはメニューバーから給与量計算機ページに移動します。 まずメインフードのメーカーを選択し、次に商品名を選択します。体重を入力し「計算する」ボタンを押すと「1日の必要給与量」、「必要エネルギー量」などの計算結果が表示されます。  2種類のフードを掛け合わせた計算もできます。|

| フードレビューの閲覧 |
|---|
|![2](https://github.com/user-attachments/assets/3f870834-4ef0-48af-9df0-1a756c9fa0eb)|

| トップページの「フードレビュー」ボタンまたはメニューバーからフード一覧ページに移動します。商品名またはブランド名で検索しフードを選びます。詳細ページでは投稿されたレビューや評価を閲覧したり、公式の商品ページを見に行くことができます。評価は5段階で行われ、「評価の平均値」、「評価件数」、「評価内容の割合」を確認することができます。 |

| ペット一覧の閲覧 |
|---|
|![3](https://github.com/user-attachments/assets/c99f1339-c71f-4f48-b7e7-de96c0e77f03)|
| トップページの「みんなのペット」ボタンまたはメニューバーからペット一覧ページに移動します。投稿されたペットを閲覧できます。画像をクリックすると詳細ページに遷移し、「ユーザー名」、「ペットの名前」、「コメント」、「体重」、「登録日」を確認することができます。「投稿したユーザー名」と「ペットの名前」はXで共有することができます。またユーザー名をクリックすると投稿したユーザーのユーザーページを見に行くことができます。 |

## ⚫︎ユーザー登録後に利用できる機能
| ユーザー登録/ログイン |
|---|
|![4](https://github.com/user-attachments/assets/b8c1d57d-17f2-4ab4-a736-0a4425e83452)|
| メニューバーから新規登録またはログインページに移動します。『ユーザー名』『メールアドレス』『パスワード』『確認用パスワード』を入力してユーザー登録を行います。ユーザー登録後は、自動的にログイン処理が行われるようになっており、そのまま直ぐにサービスを利用する事が出来ます。  また、Googleアカウントを用いてGoogleログインを行う事も可能です。 |


| 給与量の計算結果の保存 |
|---|
|![5](https://github.com/user-attachments/assets/35a97c95-64b7-43cb-84f9-3bfdf27cdef7)|
| 給与量計算後自身のユーザーページに計算結果を保存し見返すことができます。これは他のユーザーには表示されません。 |

| フードレビューの投稿 |
|---|
|![6](https://github.com/user-attachments/assets/c87adfa0-0276-466e-92a1-cc2aab6a68a4)|
| フード詳細ページからレビューの投稿ができます。⭐️マークをクリックすることで5段階で評価し、コメントを残すことができます。 |

| ペットの投稿 |
|---|
|![7](https://github.com/user-attachments/assets/340f2687-6748-4d3d-ae8d-93c57fd98bbb)|
| ペット一覧またはユーザーページからペットの投稿ができます。「ペットの名前」、「画像」、「ペットの紹介文」、「体重」を登録できます。  投稿したペットの詳細ページから編集、削除することができます。|

| ユーザーページの編集 |
|---|
|![8](https://github.com/user-attachments/assets/67e3384b-d562-489b-8620-2ac3f88d9f40)|
| メニューバーからユーザーページに移動します。「ユーザー名」、「自己紹介文」、「プロフィール画像」を編集することがでできます。ユーザーページには「登録したペット」、「保存した計算結果」を確認することができます。また、ユーザーページからペットを登録することも可能です。|

| ブックマーク |
|---|
|![9](https://github.com/user-attachments/assets/ae2648fd-1643-4217-929d-1f3d83fc8a63)|
| ユーザー登録後、フード詳細ページからフードをブックマークすることができます。ブックマーク後、メニューバーからブックマーク一覧ページに移動し気になるフードや使用しているフードを見返すことができます。 |


# ■ サービスの差別化ポイント
- 自社商品だけの給与量計算サービスは存在しますが実際に購入されているフードは家庭内でメーカー統一されているとは限りません。メーカーが変わる度にサイトを探し直さなければなりませんがこのアプリでは組み合わせ自由に計算してくれます。
- [類似サイト](https://jamc.co.jp/calc_01/)　は自信が保有するフードのカロリー情報で給与量を算出するのに対し、「Cat Food Mate」は事前にカロリーを登録してあるフード情報を選択で給与量を算出するようにしているので調べる手間を省きます。



# ■ 技術構成について
## ⚫︎使用技術
|カテゴリ|技術|
|---|---|
|バックエンド|Ruby on Rails 7.2.2・Ruby 3.2.2|
|フロントエンド|Ruby on Rails/JavaScript|
|CSSフレームワーク|Tailwindcss ・ daisyUI|
|DBサーバー|PostgreSQL|
|ファイルサーバー|AWS S3|
|アプリケーションサーバー|Render.com|
|バージョン管理ツール|GitHub|
|開発環境|Docker|


## ⚫︎画面遷移図
画面遷移図は [こちら](https://www.figma.com/design/jfImpWjg65KPVDRxaSXvFQ/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&node-type=canvas&t=uf64iiMxuP1pxCDT-0)

## ⚫︎ER図
[![Image from Gyazo](https://i.gyazo.com/cafd9b7399c22587d9bf218d80509868.png)](https://gyazo.com/cafd9b7399c22587d9bf218d80509868)
詳しくは [こちら](https://drive.google.com/file/d/18AUWoT777u1tXFmUPnCD8LOkT8qov7YB/view?usp=sharing)
