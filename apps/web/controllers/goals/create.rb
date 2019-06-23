module Web
  module Controllers
    module Goals
      class Create
        include Web::Action

        def call(params)
          repo.create(params[:goal])

          redirect_to '/goals'
        end

        def repo
          GoalRepository.new
        end
      end
    end
  end
end
