json.item_id        @review.item_id
json.title          @review.title
json.content        @review.content
json.image          @review.image
json.user_id        @review.user.id
json.user_nickname  @review.user.nickname
json.created_at     @review.created_at.to_date
