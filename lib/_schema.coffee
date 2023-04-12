@_schema = (_objName, _addData) ->
  rslt = {}

  addData = _addData or {}

  switch _objName
    when 'campInfo'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        startAt: new Date()
        title:''    #캠프소개-제목
        content: '' #html string
        img_id: ''  #캠프-대표 이미지

    when 'campAlbum'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        title:''  #앨범제목
        img_id: ''  #대표 이미지. required
        year: 2000 #앨범년도 2023~
        category: '' #여름/겨울

    when 'campAlbumImages'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        campAlbum_id: ''
        img_id: ''    #required

    when 'campReview'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        password: ''
        content:'' #리뷰내용 html string
        username:''  #리뷰작성자
        year: 2000 #앨범년도
        category: '' #여름/겨울

    when 'contact'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        name:'' #상담받을사람이름
        phone:"" #상담받을사람 번호
        message:'' #상담받을 내용
        type: '' #일반 / 국제

    when 'internationalContact'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        name:'' #상담받을사람이름
        phone:"" #상담받을사람 번호
        content:'' #상담받을 내용

    else
      throw new Error '### Data Schema Not found'
  return _.extend rslt, addData

