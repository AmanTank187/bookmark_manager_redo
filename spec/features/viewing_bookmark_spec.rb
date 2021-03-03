feature 'Viewing bookmarks' do 
    scenario 'Visiting the bookmark page and seeing a bookmark' do
        Bookmark.create(url: "http://www.makersacademy.com")
        Bookmark.create(url: "http://www.destroyallsoftware.com")
        Bookmark.create(url: "http://www.google.com")

        visit('/bookmarks')
        
        expect(page).to have_content "http://www.makersacademy.com"
        expect(page).to have_content "http://www.destroyallsoftware.com"
        expect(page).to have_content "http://www.google.com"
    end
end 