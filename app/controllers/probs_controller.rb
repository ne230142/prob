# encoding:utf-8
class ProbsController < ApplicationController
  # GET /probs
  # GET /probs.json
  def index
    @probs = Prob.all
    @wdays = ["日", "月", "火", "水", "木", "金", "土"]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @probs }
    end
  end

  # GET /probs/1
  # GET /probs/1.json
  def show
    @prob = Prob.find(params[:id])
    @states = State.find_all_by_prob_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prob }
    end
  end

  # GET /probs/new
  # GET /probs/new.json
  def new
    @prob = Prob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prob }
    end
  end

  # GET /probs/1/edit
  def edit
    @prob = Prob.find(params[:id])
  end

  # POST /probs
  # POST /probs.json
  def create
    @prob = Prob.new(params[:prob])
    states = @prob.state.split("\n")
    a = 0
    states.each do |state|
      @state = @prob.states.build(
        prob_id: @prob.id,
        compo: state,
        ans: a
      )
      a = 1
    end


    respond_to do |format|
      if @prob.save
        format.html { redirect_to @prob, notice: 'Prob was successfully created.' }
        format.json { render json: @prob, status: :created, location: @prob }
      else
        format.html { render action: "new" }
        format.json { render json: @prob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /probs/1
  # PUT /probs/1.json
  def update
    @prob = Prob.find(params[:id])

    respond_to do |format|
      if @prob.update_attributes(params[:prob])
        format.html { redirect_to @prob, notice: 'Prob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probs/1
  # DELETE /probs/1.json
  def destroy
    @prob = Prob.find(params[:id])
    @prob.destroy

    respond_to do |format|
      format.html { redirect_to probs_url }
      format.json { head :no_content }
    end
  end

  def exam
    #@probs = Prob.find_all_by_auther('a')
    @probs = []
    @p = params[:question]
    @p.each do |key, value| 
      if value.to_i == 1
        @probs << Prob.find(key)
      end
    end
    @states = []
    @probs.each do |prob|
      @states << State.find_all_by_prob_id(prob.id)
    end

    respond_to do |format|
      format.html # exam_probs.html.erb
      format.json { render json: @probs }
    end
  end
end
