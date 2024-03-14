part of 'feed_widget.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String duration;
  final int totalStars;
  final double filledStars;
  final double averageRating;
  final int totalVotes;
  final Color favoriteIconColor;

  const NewsTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.totalStars,
    required this.filledStars,
    required this.averageRating,
    required this.totalVotes,
    required this.favoriteIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 4 / 7,
      width: MediaQuery.of(context).size.width * 4 / 7,
      child: newsCard(context),
    );
  }

  Card newsCard(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(ViewConstants.mediumBorderRadius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    //height: ,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(ViewConstants.smallPadding),
                    child: _NewsTextColumnForNewsTile(
                        title: title, subtitle: subtitle, duration: duration),
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: _NewsRatingBarForNewsTile(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: NewsFavoriteIconButton(
              key: Key(title),
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsRatingBarForNewsTile extends StatelessWidget {
  const _NewsRatingBarForNewsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      textDirection: TextDirection.ltr,
      itemSize: 20,
      itemCount: 5,
      initialRating: 0, //filledStars,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // print(rating);
      },
      //totalVotes: totalVotes,
    );
  }
}

class _NewsTextColumnForNewsTile extends StatelessWidget {
  const _NewsTextColumnForNewsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
  });

  final String title;
  final String subtitle;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: ViewConstants.mediumPadding),
        Text(duration, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: ViewConstants.mediumPadding),
      ],
    );
  }
}

class NewsFavoriteIconButton extends StatefulWidget {
  const NewsFavoriteIconButton({super.key});

  @override
  State<NewsFavoriteIconButton> createState() => _NewsFavoriteIconButtonState();
}

class _NewsFavoriteIconButtonState extends State<NewsFavoriteIconButton> {
  late bool isLikedPost;
  @override
  void initState() {
    super.initState();
    isLikedPost = false;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLikedPost ? Icons.favorite : Icons.favorite_border,
        color: isLikedPost ? Colors.red : Colors.white,
      ),
      onPressed: () {
        // Kalp iconuna tıklama işlemleri buraya eklenebilir.

        setState(() {
          isLikedPost = !isLikedPost;
        });
      },
    );
  }
}
