class FeedingCalculationController < ApplicationController
  before_action :authenticate_user!, only: [ :save ]

  def new
    @foods = Food.all
  end

  def calculate
    # フードと体重の取得
    food = Food.find(params[:food_id])
    weight = params[:weight].to_f

    # 必要エネルギー要求量 (RER) の計算
    rer = food.seventy.to_f * (weight ** food.coefficient.to_f)

    # 必要給与量の計算
    daily_amount = (rer / food.calories_per_gram.to_f).round

    # 結果を表示 (保存はしない)
    @result = {
      food_id: food.id,
      weight: weight,
      daily_amount: daily_amount.round(2),
      calories: rer.round(2)
    }

    food = Food.find(@result[:food_id])
    @result[:food_name] = food.name  # foodの名前を追加

    render :result
    # redirect_to result_feeding_calculation_index_path
  end

  def save
    Rails.logger.debug("Food ID: #{params[:food_id]}")
    # ログインユーザーのみ保存
    food = Food.find(params[:food_id])
    weight = params[:weight].to_f
    # cat_name = params[:cat_name]

    rer = food.seventy.to_f * (weight ** food.coefficient.to_f)
    daily_amount = (rer / food.calories_per_gram.to_f).round

    @result = {
      food_id: food.id,
      weight: weight,
      daily_amount: daily_amount.round(2),
      calories: rer.round(2) # ここでも小数点第二位まで丸める
    }


    # 猫情報を保存
    cat = current_user.cats.create(weight: weight) # name: cat_name,

    # 給与計算結果を保存
    FeedingCalculation.create!(
      user: current_user,
      cat: cat,
      main_food_id: food.name,
      cat_id: cat.id,
      main_food_id: food.id,
      main_food_amount: daily_amount,
      total_daily_calories: rer.round(2)
    )

    flash[:notice] = "給与量の計算結果を保存しました！"
    redirect_to user_path(current_user.id)
  end
end
