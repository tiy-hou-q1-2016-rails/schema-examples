class WelcomeController < ApplicationController
  def index

    # sql_query = "select * from nfl_suspensions"

    # @nfl_suspensions = ActiveRecord::Base.connection.execute(sql_query)

    @nfl_suspensions = NflSuspension.all.order("category")

    if params[:query].present?
      @nfl_suspensions = @nfl_suspensions.where("name ILIKE ?", "%#{params[:query]}%")
    end

    if params[:category].present?

      if params[:category] == "all-drugs"
        @nfl_suspensions = @nfl_suspensions.where("category ILIKE ? OR category ILIKE ?", "%PEDs%", "%Substance%")

      else
        @nfl_suspensions = @nfl_suspensions.where("category ILIKE ?", "%#{params[:category]}%")
      end


    end

  end

  def repeat_peds
    @nfl_suspensions = NflSuspension.all.where("category = ?", "PEDs, repeated offense")
    render :index
  end

  def peds
    @nfl_suspensions = NflSuspension.all.where("category ILIKE '%PEDs%'")
    render :index
  end

  def in_game
    @nfl_suspensions = NflSuspension.all.where(category: 'In-game violence')
    render :index
  end

  def substance_abuse
    @nfl_suspensions = NflSuspension.all.where(category: 'Substance abuse')
    render :index
  end

  def personal_conduct
    @nfl_suspensions = NflSuspension.all.where(category: 'Personal conduct')
    render :index
  end

  def show
    # sql_query = "select * from nfl_suspensions where id = #{params[:id]}"
    #
    # @nfl_suspension = ActiveRecord::Base.connection.execute(sql_query).first

    @nfl_suspension = NflSuspension.find_by id: params[:id]
  end
end
