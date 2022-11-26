module ControllerMacros
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      # create user with name
      user = FactoryBot.create(:user, name: 'test')
      sign_in user
    end
  end
end
