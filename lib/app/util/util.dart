final List<String> categories = [
  'Popular Shows',
  'Upcoming Shows',
  "Comedy",
  "Action",
  'Sci-Fi',
]; 
List<Map<String, dynamic>> movieList =[
    {
      "title": "The Adventurers",
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BZWI1Zjc0NWItZmZmZC00ZDllLThjZDYtNDViYTFkYzA5MWY2XkEyXkFqcGdeQXVyMTk0NTY2ODQ@._V1_.jpg"
    },
    {
      "title": "Live Die Repeat",
      "imageUrl":
          "https://m.media-amazon.com/images/I/71C93vSwpIL._AC_SL1000_.jpg"
    },
  {
    "title": "The Tomorrow Job",
    "imageUrl":
        "https://m.media-amazon.com/images/M/MV5BZTI4NzdiNjAtYzkzNC00MjQwLWFjZDktMDM3YTg3YzIwMDdiXkEyXkFqcGdeQXVyOTMzOTMzMTg@._V1_FMjpg_UX1000_.jpg"
  },
  {
    "title": "The Tomorrow War",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/en/thumb/6/60/The_Tomorrow_War_%282021_film%29_official_theatrical_poster.jpg/220px-The_Tomorrow_War_%282021_film%29_official_theatrical_poster.jpg"
  } ,{
      "title": "The Last Warriors",
      "imageUrl":
          "https://image.tmdb.org/t/p/w500/rEPhPb8mDomtmn6tHr3vE9QutkB.jpg"
    },
    {
      "title": "Fury Road",
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BN2EwM2I5OWMtMGQyMi00Zjg1LWJkNTctZTdjYTA4OGUwZjMyXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg"
    },
    {
      "title": "Assassin's Vendetta",
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BMjEwNzEzMTYxMl5BMl5BanBnXkFtZTcwMzc4ODIwOQ@@._V1_FMjpg_UX1000_.jpg"
    }
  ];
final Map<String, List<Map<String, dynamic>>> moviesByCategory = {
  "Popular Shows": [
    {
      "title": "The Adventurers",
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BZWI1Zjc0NWItZmZmZC00ZDllLThjZDYtNDViYTFkYzA5MWY2XkEyXkFqcGdeQXVyMTk0NTY2ODQ@._V1_.jpg"
    },
    {
      "title": "Live Die Repeat",
      "imageUrl":
          "https://m.media-amazon.com/images/I/71C93vSwpIL._AC_SL1000_.jpg"
    }
  ],
  "Upcoming Shows": [
    {
      "title": "The Tomorrow Job",
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BZTI4NzdiNjAtYzkzNC00MjQwLWFjZDktMDM3YTg3YzIwMDdiXkEyXkFqcGdeQXVyOTMzOTMzMTg@._V1_FMjpg_UX1000_.jpg"
    },
    {
      "title": "The Tomorrow War",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/en/thumb/6/60/The_Tomorrow_War_%282021_film%29_official_theatrical_poster.jpg/220px-The_Tomorrow_War_%282021_film%29_official_theatrical_poster.jpg"
    }
  ],
  "Action": [
    {
      "title": "The Last Warriors",
      "imageUrl":
          "https://image.tmdb.org/t/p/w500/rEPhPb8mDomtmn6tHr3vE9QutkB.jpg"
    },
    {
      "title": "Fury Road",
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BN2EwM2I5OWMtMGQyMi00Zjg1LWJkNTctZTdjYTA4OGUwZjMyXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg"
    },
    {
      "title": "Assassin's Vendetta",
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BMjEwNzEzMTYxMl5BMl5BanBnXkFtZTcwMzc4ODIwOQ@@._V1_FMjpg_UX1000_.jpg"
    }
  ],
  "Comedy": [
    {
      "title": "Laugh Out Loud",
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BODQxYWM2ODItYjE4ZC00YzAxLTljZDQtMjRjMmE0ZGMwYzZjXkEyXkFqcGdeQXVyODIyOTEyMzY@._V1_.jpg"
    },
    {
      "title": "Hilarious Chaos",
      "imageUrl":
          "https://e1.pxfuel.com/desktop-wallpaper/832/474/desktop-wallpaper-chaos-movie-poster-chaos-movie-thumbnail.jpg"
    },
    {
      "title": "The Pranksters",
      "imageUrl":
          "https://images.static-bluray.com/products/20/69552_1_large.jpg"
    }
  ],
  "Sci-Fi": [
    {
      "title": "Tron",
      "imageUrl":
          "https://www.discountdisplays.co.uk/our-blog/wp-content/uploads/tron-legacy-776x1024.jpg"
    },
    {
      "title": "Another Earth",
      "imageUrl":
          "https://www.indiewire.com/wp-content/uploads/2017/09/another-earth-2011.jpg?w=674"
    }
  ]
};

class Utils {
  static Map<String, dynamic> exceptionWidget(bool error, {String? message}) {
    if (error) {
      return {'sucess': error, 'message': "successfully"};
    } else {
      return {'sucess': error, 'message': message!};
    }
  }

  static String getGifImagePath(String name, {String format = 'gif'}) {
    return 'assets/gif/$name.$format';
  }

  static String getImageIconPath(String name, {String format = 'png'}) {
    return 'assets/icons/$name.$format';
  }

  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getJsonFilePath(String name, {String format = 'json'}) {
    return 'assets/json/$name.$format';
  }

  static String getSvgFilePath(String name, {String format = 'svg'}) {
    return 'assets/svg/$name.$format';
  }
}
