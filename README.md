# cat-project
# ■サービス概要
どんなサービスなのかを３行で説明してください。
- 猫の1日の必要給与量を計算してー提示してくれるサービス。
- 新しいフード購入時の給与計算、子猫の体重変化が大きい時期等の手助けをを行ってくれるアプリです。
- フードのレビューを共有しフードの情報交換を行えます。

# ■ このサービスへの思い・作りたい理由
このサービスの題材となるものに関してのエピソードがあれば詳しく教えてください。
このサービスを思いつくにあたって元となる思いがあれば詳しく教えてください。
- 去年、今年と子猫をお迎えしましたが移り変わる体重、フードに対し給与計算が煩わしく感じていました。我が家では生後1〜３ヶ月、４ヶ月〜一歳、一歳以降でフードのメーカー、種類が違ったため都度計算し直していました。もちろん体重が増えるとまた計算し直しです。また猫の状態次第でウェットフードをあげたり普段とは違うドライフードをあげることもあるため計算してくれるアプリが欲しいと思ったのがきっかけです。
	中には食べてくれるフードを模索している、子猫を頻繁に預かっているなど諸事情で頻繁にフードを変える家庭もあるかと思います。そんな方への手助けになるアプリを作りたいです。

# ■ ユーザー層について
決めたユーザー層についてどうしてその層を対象にしたのかそれぞれ理由を教えてください。
- 猫を飼っている家庭：自身でも課題になっているため解決したかったからです。
	

# ■サービスの利用イメージ
ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかを簡単に説明してください。
- 二種類までのフードメーカー、フード名、体重を入力。
- 1日の必要給与量計算しを提示することでユーザーは簡単にに給与量を確認することができます。
- フード給与量計算を記録し前回計算時の内容確認ができます
- フードの評価を共有できます

# ■ ユーザーの獲得について
想定したユーザー層に対してそれぞれどのようにサービスを届けるのか現状考えていることがあれば教えてください。
## MVPリリース
-「猫　給与量」検索時のSEO対策：sitemapを検討中
## 本リリース
- Xで共有

# ■ サービスの差別化ポイント・推しポイント
似たようなサービスが存在する場合、そのサービスとの明確な差別化ポイントとその差別化ポイントのどこが優れているのか教えてください。
独自性の強いサービスの場合、このサービスの推しとなるポイントを教えてください。
- 自社商品だけの給与量計算サービスは存在しますが実際に購入されているフードはメーカー統一とは限りません。メーカーが変わる度にサイトを探し直さなければなりませんがこのアプリでは組み合わせ自由に計算してくれます。

# ■ 機能候補
現状作ろうと思っている機能、案段階の機能をしっかりと固まっていなくても構わないのでMVPリリース時に作っていたいもの、本リリースまでに作っていたいものをそれぞれ分けて教えてください。
## MVPリリース
- 給与量計算機能（有名メーカーのみ）
- ユーザー登録機能
- ログイン、ログアウト機能
- 前回給与計算結果の保存
- フードの評価機能：レーディング
- フードの評価機能の「参考になった」ボタン
## 本リリース
- Google認証
- 給与計算機能のメーカー、フード増設
- おまけ「うちの猫自慢コーナー」：愛猫の写真投稿掲示板
- 「うちの猫自慢コーナー」コメント機能
- 「うちの猫自慢コーナー」いいね機能
- 「うちの猫自慢コーナー」X共有機能、OGP


# ■ 機能の実装方針予定
一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。
## MVPリリース
- gem Stimulus Autocomplete：オートコンプリート機能
- gem devise：認証機能
## 本リリース
- Active Storageを使ってアップロード
- AWS S3にアップロードされた画像を保存
- gem ominiauth：Google認証
