class ApplicationController < ActionController::API
    before_action :session_destroy
    private
    def session_destroy
        debugger
    end
end
