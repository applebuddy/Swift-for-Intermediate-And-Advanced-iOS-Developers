// MARK: 19. Enum and Raw Values
// 1) enum rawValue가 변동사항이 있어 잘못된 동작을 유발할 가능성이 있는 경우, 아래와 같은 분기를 두어 별도로 처리하는 방법이 있다.

import UIKit

enum ImageType: String {
  case jpg
  case bmp
  case png
  
  // jpg, jpeg 모두 jpg 타입으로 보고 싶다면? init?(rawValue: String) {} 생성자를 활용해볼 수 있다.
  init?(rawValue: String) {
    // 생성자에 들어간 rawValue가 jpg, jpeg일 경우에는 .jpg 타입으로 설정되도록 했다. 잘못된 rawValue가 들어가면 nil을 반환하는 생성자이다.
    switch rawValue.lowercased() {
    case "jpg", "jpeg": self = .jpg
    case "bmp": self = .bmp
    case "png": self = .png
    default: return nil
    }
  }
}

func iconName(for fileExtension: String) -> String {
  
  guard let imageType = ImageType(rawValue: fileExtension) else {
    return "assetUnknown"
  }
  
  switch imageType {
  case .jpg: return "assetJPG"
  case .bmp: return "assetBMP"
  case .png: return "assetPNG"
  }
}

iconName(for: "jpg")
iconName(for: "jpeg")

/*
// 1) enum rawValue가 변동사항이 있어 잘못된 동작을 유발할 가능성이 있는 경우, 아래와 같은 분기를 두어 별도로 처리하는 방법이 있다.
enum NetworkError: Error {
  case badURL
  case decodingError
}

enum TemperatureUnit: String {
  case imperial = "F" // 여러 사유로 잘못 된 값이 들어갈 수 있다...
  case metric = "C"
}

// enum rawValue가 변동사항이 있어 잘못된 동작을 유발할 수 있는 경우, 아래와 같은 분기를 두어 별도로 처리하는 방법이 있다.
private func getWeatherURL(unit: TemperatureUnit) -> URL? {
  switch unit {
  case .imperial:
    return URL(string: "www.weather.com/?unit=fahrenheit")
  case .metric:
    return URL(string: "www.weather.com/?unit=celsius")
  }
}

func getWeather(unit: TemperatureUnit) throws {
  
//  guard let url = URL(string: "www.weather.com/?unit=\(unit.rawValue)") else {
//    throw NetworkError.badURL
//  }
  guard let weatherURL = getWeatherURL(unit: unit) else {
    throw NetworkError.badURL
  }
  print(weatherURL)
  // code to call the weather API
}

do {
  try getWeather(unit: .metric)
} catch {
  print(error)
}
*/
