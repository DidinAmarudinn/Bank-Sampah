class FilterModel  {
  final bool? isOjekHarian;
  final bool? isOjekBerlanggan;
  final bool? isPulsa;
  final bool? isListrik;
  final bool? isPdam;
  final bool? isSuccess;
  final bool? isCancelled;

  const FilterModel(
      {this.isOjekHarian,
      this.isOjekBerlanggan,
      this.isPulsa,
      this.isListrik,
      this.isPdam,
      this.isSuccess,
      this.isCancelled});

  FilterModel copyWith({
    bool? isOjekHarian,
    bool? isOjekBerlanggan,
    bool? isPulsa,
    bool? isListrik,
    bool? isPdam,
    bool? isSuccess,
    bool? isCancelled,
  }) {
    return FilterModel(
      isOjekHarian: isOjekHarian ?? this.isOjekHarian,
      isOjekBerlanggan: isOjekBerlanggan ?? this.isOjekBerlanggan,
      isPulsa: isPulsa ?? this.isPulsa,
      isListrik: isListrik ?? this.isListrik,
      isPdam: isPdam ?? this.isPdam,
      isSuccess: isSuccess ?? this.isSuccess,
      isCancelled: isCancelled ?? this.isCancelled,
    );
  }


}
