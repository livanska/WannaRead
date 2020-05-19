module BooksHelper
    def tag_list(tags)
        tags.each do |tag|
            yield(tag)
        end
    end
end
