module Web
  module Controllers
    module Goals
      class Create
        include Web::Action

        params do
          required(:goal).schema do
            required(:title).filled(:str?)
          end
        end

        def call(params)
          if params.valid?
            repo.create(params[:goal])

            redirect_to '/goals'
          else
            self.status = 422
          end
        end

        def repo
          GoalRepository.new
        end
      end
    end
  end
end
