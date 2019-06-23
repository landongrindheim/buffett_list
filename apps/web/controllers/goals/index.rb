module Web
  module Controllers
    module Goals
      class Index
        include Web::Action

        expose :goals

        def call(params)
          @goals = GoalRepository.new.all
        end
      end
    end
  end
end
