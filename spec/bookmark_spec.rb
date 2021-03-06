require 'bookmark' 
require 'database_helpers'

describe Bookmark do
    describe '.all' do
        it 'returns a list of bookmarks' do
          bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
          Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
          Bookmark.create(url: "http://www.google.com", title: "Google")
       
          bookmarks = Bookmark.all
       
          expect(bookmarks.length).to eq 3
          expect(bookmarks.first).to be_a Bookmark
          expect(bookmarks.first.id).to eq bookmark.id
          expect(bookmarks.first.title).to eq 'Makers Academy'
          expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
         end
       end

       describe '.find' do
         it 'finds a specific bookmark' do 
          bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy") 

          bookmarks = Bookmark.find(id: bookmark.id)

          expect(bookmarks.id).to eq bookmark.id
          expect(bookmarks.title).to eq 'Makers Academy'
          expect(bookmarks.url).to eq 'http://www.makersacademy.com'
         end 
        end 

       describe '.create' do
        it 'creates a new bookmark' do
          bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
          persisted_data = persisted_data(table: "bookmarks",id: bookmark.id)
          expect(bookmark).to be_a Bookmark
          expect(bookmark.id).to eq persisted_data.first['id']
          expect(bookmark.title).to eq 'Test Bookmark'
          expect(bookmark.url).to eq 'http://www.testbookmark.com'
        end

        it 'It does not create a new bookmark if URL is not valid' do
          Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
          expect(Bookmark.all).to be_empty
        end  
      end

      describe '.delete' do
        it 'Deletes a bookmark' do
         bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

         Bookmark.delete(id: bookmark.id)

         expect(Bookmark.all.length).to eq 0
        end
    end 

        describe '.update' do 
            it 'Updates a bookmark with given data' do
              bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
              updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

              expect(updated_bookmark).to be_a Bookmark
              expect(updated_bookmark.id).to eq bookmark.id
              expect(updated_bookmark.title).to eq 'Snakers Academy'
              expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
            end 
        end 

        let(:comment_class) {double(:comment_class)}
        describe '.comments' do
          it 'Calls the .where method on the comment class to get comments for a bookmark' do
            bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
            DatabaseConnection.query("INSERT INTO comments (id, text, bookmark_id) VALUES(1, 'Test comment', #{bookmark.id})")
            expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

            bookmark.comments(comment_class)
          end 
        end 
      
end 