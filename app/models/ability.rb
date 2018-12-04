class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    user ||= User.new #guest user (not logged in)

    can :read, :all
    can :create, :all

    #Juliano Iankoski
    # Toda classe nova que for implementada, mesmo que criada através de Scaffold deve
    # ter sus autorizações de usuário ajustadas aqui.

    can :manage, Answers do |answers|
      answers.user == user
    end
    can :manage, Business do |business|
      business.user == user
    end
    can :manage, Competitiveness do |competitiveness|
      competitiveness.user == user
    end
    can :manage, Contextualization do |contextualization|
      contextualization.user == user
    end
    can :manage, Finances do |finances|
      finances.user == user
    end
    can :manage, Groups do |groups|
      groups.user == user
    end
    can :manage, Marketing do |marketing|
      marketing.user == user
    end
    can :manage, Process do |process|
      process.user == user
    end
    can :manage, Questions do |questions|
      questions.user == user
    end
    can :manage, Resources do |resources|
      resources.user == user
    end
  end
end
