module DeviseControllerPatch
  extend ActiveSupport::Concern

  included do
    respond_to :json
  end
end

DeviseController.send :include, DeviseControllerPatch
