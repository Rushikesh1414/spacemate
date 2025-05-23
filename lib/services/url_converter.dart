String convertImageUrl(String url) {
  return url
      .replaceFirst("https://pub-a82fb85882784f3591b34db19d350dfc.r2.dev",
          "https://onboardingimages.spacemate.xyz")
      .replaceFirst(".jpg", ".webp");
}
