require 'feature_helper'

feature 'Sign in' do
  context 'exists user can sign in' do
    let(:user) { create(:user) }

    background do
      visit new_session_path
    end

    scenario 'valid data' do
      within '#sign_in_form' do
        fill_in 'email', with: user.email
        fill_in 'password', with: 'qwerty123'
        click_on t('sign_in')
      end

      expect(page).to have_content t('signed_in')
    end

    scenario 'invalid data' do
      within '#sign_in_form' do
        fill_in 'email', with: user.email
        fill_in 'password', with: 'qwertyasfasf123'
        click_on t('sign_in')
      end

      expect(page).to have_content t('invalid_email_or_password')
    end
  end
end