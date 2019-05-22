
Comment(
  [
    {
      name: 'ながそえ',
      text: <<-EOS,
        hello, world!
        hello, ruby!
        hello, ruby on rails!
        EOS
      created_at: 2018-5-14,
      like:[0,click],
      edit: click,
      destroy: click
    },
    {
      name: 'ながそえ',
      text: <<-EOS,
        hello, world!
        hello, ruby!
        hello, ruby on rails!
        EOS
      created_at: 2018-5-14,
      like_count:0
      like: click,
      edit: click,
      destroy: click
    },
)


%!
hello, world
hello, ruby
hello, ruby on rails
!

<<'EOS'
                  hello, world!
                  hello, ruby!
                  hello, ruby on rails!
                  EOS

                  <<-EOS
                  hello, world!
                  hello, ruby!
                  hello, ruby on rails!
                  EOS