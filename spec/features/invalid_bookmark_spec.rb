feature 'Flash message with invalid input' do 
    scenario 'Visiting the bookmark/new page and giving invalid input' do
        visit ('/bookmarks/new')
        fill_in('url', :with => 'NOT A BOOKMARK')
        click_button('Submit')
        expect(page).not_to have_link('Test Bookmark', href: 'http://testbookmark.com')
        expect(page).to have_content "You must submit a valid URL"
    end 
end 