import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
    BookModel({
        required this.kind,
        required this.totalItems,
        required this.items,
    });

    String kind;
    int totalItems;
    List<Item> items;

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        required this.kind,
        required this.id,
        required this.etag,
        required this.selfLink,
        required this.volumeInfo,
        required this.saleInfo,
        required this.accessInfo,
       
    });

    String kind;
    String id;
    String etag;
    String selfLink;
    VolumeInfo volumeInfo;
    SaleInfo saleInfo;
    AccessInfo accessInfo;
  

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
   
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
        "saleInfo": saleInfo.toJson(),
        "accessInfo": accessInfo.toJson(),
    };
}

class AccessInfo {
    AccessInfo({
        required this.country,
        required this.viewability,
        required this.embeddable,
        required this.publicDomain,
        required this.textToSpeechPermission,
        required this.epub,
        required this.pdf,
        required this.webReaderLink,
        required this.accessViewStatus,
        required this.quoteSharingAllowed,
    });

    String country;
    String viewability;
    bool embeddable;
    bool publicDomain;
    String textToSpeechPermission;
    Epub epub;
    Epub pdf;
    String webReaderLink;
    String accessViewStatus;
    bool quoteSharingAllowed;

    factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: Epub.fromJson(json["epub"]),
        pdf: Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
    };
}

class Epub {
    Epub({
        required this.isAvailable,
    });

    bool isAvailable;

    factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
    };
}

class SaleInfo {
    SaleInfo({
        required this.country,
        required this.saleability,
        required this.isEbook,
    });

    String country;
    String saleability;
    bool isEbook;

    factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
    };
}

class SearchInfo {
    SearchInfo({
        required this.textSnippet,
    });

    String textSnippet;

    factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
    );

    Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
    };
}

class VolumeInfo {
    VolumeInfo({
        required this.title,
         required this.authors,
          this.publisher,
         this.publishedDate,
        required this.description,
        required this.readingModes,
         this.pageCount,
        required this.printType,
        required this.categories,
        required this.maturityRating,
        required this.allowAnonLogging,
        required this.contentVersion,
         this.imageLinks,
        required this.language,
        required this.previewLink,
        required this.infoLink,
        required this.canonicalVolumeLink,
    });

    String title;
    String? publisher;
    List<String>? authors;
    String? publishedDate;
    String description;
    ReadingModes readingModes;
    int? pageCount;
    String printType;
    List<String>? categories;
    String maturityRating;
    bool allowAnonLogging;
    String contentVersion;
    ImageLinks? imageLinks;
    String language;
    String previewLink;
    String infoLink;
    String canonicalVolumeLink;

    factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        publisher: json["publisher"] ?? "",
        authors: List<String>.from(json['authors'] ?? []) ,
        publishedDate: json["publishedDate"],
        description: json["description"]?? "",
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"] ?? 0,
        printType: json["printType"],
        categories: List<String>.from(json["categories"]?? []),
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        imageLinks: ImageLinks.fromJson(json["imageLinks"]?? {}),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "publisher":publisher,
        "publishedDate": publishedDate,
        "description": description,
        "readingModes": readingModes.toJson(),
        "pageCount": pageCount,
        "printType": printType,
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "imageLinks": imageLinks?.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
    };
}

class ImageLinks {
    ImageLinks({
         this.smallThumbnail,
         this.thumbnail,
    });

    String? smallThumbnail;
    String? thumbnail;

    factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
    };
}

class IndustryIdentifier {
    IndustryIdentifier({
        required this.type,
        required this.identifier,
    });

    String type;
    String identifier;

    factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
    };
}

class PanelizationSummary {
    PanelizationSummary({
        required this.containsEpubBubbles,
        required this.containsImageBubbles,
    });

    bool containsEpubBubbles;
    bool containsImageBubbles;

    factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
    );

    Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
    };
}

class ReadingModes {
    ReadingModes({
        required this.text,
        required this.image,
    });

    bool text;
    bool image;

    factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
    };
}
