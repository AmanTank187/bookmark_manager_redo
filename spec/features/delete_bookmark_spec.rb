feature 'Delete a bookmark' do
    scenario 'Deleting a bookmark from the page' do
        connection = PG.connect(dbname: 'bookmark_manager_test')
        Bookmark.create(url: 'http//www.makersacademy.com',title: 'Makers Academy')
        visit ('/bookmarks')
        expect(page).to have_link('Makers Academy', href: 'http//www.makersacademy.com')

        first('.bookmark').click_button 'Delete'

        expect(current_path).to eq '/bookmarks'
        expect(page).not_to have_link('Makers Academy', href: 'http//www.makersacademy.com')
    end 
end 