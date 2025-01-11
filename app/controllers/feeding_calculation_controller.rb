class FeedingCalculationController < ApplicationController
  before_action :authenticate_user!, only: [ :save ]

  def new
    @brand = Brand.all
    @foods = Food.all
  end

  def calculate
    if params[:main_food_id].blank?
      redirect_to root_path, alert: "メインフードを選択してください。" and return
    end

    # フードと体重の取得
    main_brand = Brand.find(params[:main_brand_id])
    sub_brand = params[:sub_brand_id].present? ? Brand.find(params[:sub_brand_id]) : nil
    main_food = Food.find(params[:main_food_id])
    weight = params[:weight].to_f
    sub_food = params[:sub_food_id].present? ? Food.find(params[:sub_food_id]) : nil

    # 必要エネルギー要求量 (RER) の計算
    main_rer = main_food.seventy.to_f * (weight ** main_food.coefficient.to_f)
    sub_rer = sub_food ? sub_food.seventy.to_f * (weight ** sub_food.coefficient.to_f) : 0

    # 必要給与量の計算
    if sub_food
      main_daily_amount = ((main_rer / 2) / main_food.calories_per_gram.to_f).round(2)
      sub_daily_amount = ((sub_rer / 2) / sub_food.calories_per_gram.to_f).round(2)
    else
      main_daily_amount = (main_rer / main_food.calories_per_gram.to_f).round(2)
      sub_daily_amount = 0
    end

    total_daily_calories =
    if sub_food
      (main_rer / 2 + sub_rer / 2).round(2)  # メインフードとサブフードを50%ずつ
    else
      main_rer.round(2)  # メインフードのみ
    end


    # main_amount = (main_rer / main_food.calories_per_gram.to_f).round
    # sub_food_amount = sub_food ? (sub_rer / sub_food.calories_per_gram.to_f).round : 0

    # 結果を表示 (保存はしない)
    @result = {
      main_brand_id: main_brand.id,
      main_food_id: main_food.id,
      sub_brand_id: sub_brand&.id,
      sub_food_id: sub_food&.id,
      weight: weight,
      main_food_amount: main_daily_amount,
      sub_food_amount: sub_daily_amount,
      total_daily_calories: total_daily_calories

    }
    
    @result[:main_brand_name] = main_brand.name
    @result[:main_food_name] = main_food.name  # foodの名前を追加
    @result[:sub_brand_name] = sub_brand&.name
    @result[:sub_food_name] = sub_food&.name  

    render :result
  end

  def save
    # ログインユーザーのみ保存
    main_brand = Brand.find(params[:main_brand_id])
    sub_brand = params[:sub_brand_id].present? ? Brand.find(params[:sub_brand_id]) : nil
    main_food = Food.find(params[:main_food_id])
    sub_food = params[:sub_food_id].present? ? Food.find(params[:sub_food_id]) : nil
    weight = params[:weight].to_f

    # cat_name = params[:cat_name]

    main_rer = main_food.seventy.to_f * (weight ** main_food.coefficient.to_f)
    sub_rer = sub_food ? sub_food.seventy.to_f * (weight ** sub_food.coefficient.to_f) : 0
  
    if sub_food
      main_daily_amount = ((main_rer / 2) / main_food.calories_per_gram.to_f).round(2)
      sub_daily_amount = ((sub_rer / 2) / sub_food.calories_per_gram.to_f).round(2)
    else
      main_daily_amount = (main_rer / main_food.calories_per_gram.to_f).round(2)
      sub_daily_amount = 0
    end

    total_daily_calories =
    if sub_food
      (main_rer / 2 + sub_rer / 2).round(2)  # メインフードとサブフードを50%ずつ
    else
      main_rer.round(2)  # メインフードのみ
    end

    # 猫情報を保存
    cat = current_user.cats.create(weight: weight) # name: cat_name,

    # 給与計算結果を保存
    FeedingCalculation.create!(
      user: current_user,
      cat: cat,
      brand_id: main_brand.id,
      main_food_id: main_food.id,
      brand_id: sub_brand&.id,
      sub_food: sub_food,
      main_food_amount: main_daily_amount,
      sub_food_amount: sub_daily_amount,
      total_daily_calories: total_daily_calories
    )

    flash[:notice] = "給与量の計算結果を保存しました！"
    redirect_to user_path(current_user.id)
  end
end
