module RailsAdmin
  module Config
    module Actions
      class ImportQuestion < RailsAdmin::Config::Actions::Base

        register_instance_option :collection do
          true
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :route_fragment do
          custom_key.to_s
        end

        register_instance_option :controller do
          proc do
            if request.get?
                render action: @action.template_name
            elsif request.post?
              # question_params = params.require(:question).permit :content, :subject_id, :user_id,
      # :state, :question_type, options_attributes: [:id, :content, :correct, :_destroy]
              Question.import(params[:file])
              redirect_to root_url, notice: "Question imported"
            else
              redirect_to :back
            end
          end
        end

        register_instance_option :link_icon do
          "icon-arrow-down"
        end
      end
    end
  end
end
