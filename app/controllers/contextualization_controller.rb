class ContextualizationController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @answers = Answer.joins(:question).where('questions.group_id = 1 and user_id = ?', current_user.id)
    end

    def new
        @answer = Answer.new
        @questions = Question.where('group_id = 1')
        @method = 'create'
    end

    def edit
        @contextualization = Answer.joins(:question).where('questions.group_id = 1 and user_id = ?', current_user.id)
        @method = 'update'
    end

    def create
        params[:contextualization][:question].each do |k, v|
            answer = Answer.new
            answer.user_id = params[:contextualization][:user_id]
            answer.question_id = k;
            answer.answer = v;
            answer.save
        end
        respond_to do |format|
            format.html { redirect_to "/contextualization", notice: 'Questionário criado com sucesso.' }
            format.json { render :index, status: :created, location: @answer }
        end
    end

    def update
        params[:contextualization][:answer].each do |k, v|
            answer = Answer.find(k)
            answer.user_id = params[:contextualization][:user_id]
            answer.answer = v;
            answer.save
        end
        respond_to do |format|
            format.html { redirect_to "/contextualization", notice: 'Questionário atualizado com sucess.' }
            format.json { render :index, status: :created, location: @answer }
        end
    end

    def destroy
        @answers = Answer.joins(:question).where('questions.group_id = 1 and user_id = ?', current_user.id)
        @answers.each do |a|
            a.destroy
        end
        respond_to do |format|
            format.html { redirect_to "/contextualization", notice: 'Questionário excluído com sucesso.' }
            format.json { head :no_content }
        end
    end

end
