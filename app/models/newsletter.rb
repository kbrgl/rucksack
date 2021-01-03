class Newsletter < ApplicationRecord
  has_one_attached :logo

  def self.get
    # There's only one newsletter, so we just get the last record in the DB.
    last.presence or Newsletter.create!(
      title: 'Rucksack Newsletter',
      description: 'A newsletter about Rucksack.',
      about: 'This newsletter is about minds, machines, mail, and money.',
      accent_color: '#ae3737',
      from_name: 'Kabir from Rucksack',
      from_email: 'newsletter@example.com',
      to: 'newsletter@example.com',
      author: 'Kabir Goel',
    )
  end

  def self.logo
    get.logo
  end

  def self.title
    get.title
  end

  def self.description
    get.description
  end

  def self.about
    get.about
  end

  def self.accent_color
    # You can use any valid CSS color value here.
    get.accent_color
  end

  def self.from_name
    get.from_name
  end

  def self.from_email
    get.from_email
  end

  def self.from
    "#{from_name} <#{from_email}>"
  end

  def self.to
    # This is the email that the 'Send me an email' link in the footer points to.
    get.to
  end

  def self.author
    get.author
  end
end
