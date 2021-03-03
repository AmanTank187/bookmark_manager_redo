feature 'Add a new bookmark' do 
    scenario 'Visiting the bookmark/new page and adding a bookmark' do
        connection = PG.connect(dbname: 'bookmark_manager_test')
        visit ('/bookmarks/new')
        fill_in('url', :with => 'http://testbookmark.com')
        click_button('Submit')

        expect(page).to have_content 'http://testbookmark.com'
    end 
end 