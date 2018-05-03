package diplom

class Photo {

    byte[] file

//    static belongsTo = [news: News]

    static constraints = {
        file nullable: false
    }

    static mapping = {
        id generator: 'native',
                params: [sequence: 'photo_id_seq']
    }
}
