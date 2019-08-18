require "application_system_test_case"

module PhcdevworksScripts
  class Snippet::PostsTest < ApplicationSystemTestCase
    setup do
      @snippet_post = phcdevworks_scripts_snippet_posts(:one)
    end

    test "visiting the index" do
      visit snippet_posts_url
      assert_selector "h1", text: "Snippet/Posts"
    end

    test "creating a Post" do
      visit snippet_posts_url
      click_on "New Snippet/Post"

      fill_in "Snippet code", with: @snippet_post.snippet_code
      fill_in "Snippet title", with: @snippet_post.snippet_title
      click_on "Create Post"

      assert_text "Post was successfully created"
      click_on "Back"
    end

    test "updating a Post" do
      visit snippet_posts_url
      click_on "Edit", match: :first

      fill_in "Snippet code", with: @snippet_post.snippet_code
      fill_in "Snippet title", with: @snippet_post.snippet_title
      click_on "Update Post"

      assert_text "Post was successfully updated"
      click_on "Back"
    end

    test "destroying a Post" do
      visit snippet_posts_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Post was successfully destroyed"
    end
  end
end
