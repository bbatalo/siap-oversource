require 'csv'

class Loader
  csv_header = ['id', 'creation_date', 'tag_ids', 'body_markdown', 'up_vote_count',
                'down_vote_count', 'comment_count']

  db_header = ['legacy_id', 'legacy_date', 'tag', 'content', 'up_vote_count',
               'down_vote_count', 'comment_count']

  def initialize(uploaded_io)

    unless Dir.exist?('public/uploads')
      Dir.mkdir(Rails.root.join('public/uploads'))
    end

    @filename = Rails.root.join('public', 'uploads',
                              uploaded_io.original_filename)
    File.open(@filename, 'wb') do |file|
      file.write(uploaded_io.read)
    end

  end

  def load
    CSV.foreach(@filename, headers: true) do |row|
      post = Post.new
      post.legacy_id = row['id']
      post.legacy_date = row['creation_date']
      post.tag = row['tag_ids']
      post.content = row['body_markdown']
      post.up_vote_count = row['up_vote_count']
      post.down_vote_count = row['down_vote_count']
      post.comment_count = row['comment_count']
      post.save
    end
  end
end