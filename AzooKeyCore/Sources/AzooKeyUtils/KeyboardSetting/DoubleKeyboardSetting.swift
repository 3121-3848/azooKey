//
//  DoubleKeyboardSetting.swift
//  DoubleKeyboardSetting
//
//  Created by ensan on 2021/08/10.
//  Copyright © 2021 ensan. All rights reserved.
//

import Foundation
import SwiftUI

public protocol DoubleKeyboardSettingKey: KeyboardSettingKey, StoredInUserDefault where Value == Double {}

public extension StoredInUserDefault where Value == Double {
    @MainActor
    static func get() -> Value? {
        let object = SharedStore.userDefaults.object(forKey: key)
        return object as? Value
    }
    @MainActor
    static func set(newValue: Value) {
        SharedStore.userDefaults.set(newValue, forKey: key)
    }
}

public extension DoubleKeyboardSettingKey {
    @MainActor static var value: Value {
        get {
            get() ?? defaultValue
        }
        set {
            set(newValue: newValue)
        }
    }
}

public struct ResultViewFontSize: DoubleKeyboardSettingKey {
    public static let title: LocalizedStringKey = "変換候補の表示サイズ"
    public static let explanation: LocalizedStringKey = "変換候補の文字の大きさを指定できます。"
    public static let defaultValue: Double = -1
    public static let key: String = "result_view_font_size"
}

extension KeyboardSettingKey where Self == ResultViewFontSize {
    public static var resultViewFontSize: Self { .init() }
}

public struct KeyViewFontSize: DoubleKeyboardSettingKey {
    public static let title: LocalizedStringKey = "キーの表示サイズ"
    public static let explanation: LocalizedStringKey = "キーの文字の大きさを指定できます。文字が大きすぎる場合表示が崩れることがあります。"
    public static let defaultValue: Double = -1
    public static let key: String = "key_view_font_size"
}

extension KeyboardSettingKey where Self == KeyViewFontSize {
    public static var keyViewFontSize: Self { .init() }
}

/// フリック感度。値は0.5~2.0くらいを想定。でかい方が鈍い。
public struct FlickSensitivitySettingKey: DoubleKeyboardSettingKey {
    public static let title: LocalizedStringKey = "フリックの感度"
    public static let explanation: LocalizedStringKey = "どれだけ指を動かしたらフリックと判定するか調整できます。"
    public static let defaultValue: Double = 1
    public static let key: String = "flick_sensitivity_setting"
}

extension KeyboardSettingKey where Self == FlickSensitivitySettingKey {
    public static var flickSensitivity: Self { .init() }
}

/// フリックサジェストが消えるまでの遅延時間（秒）。0〜0.5秒を想定。
public struct FlickSuggestDismissDurationKey: DoubleKeyboardSettingKey {
    public static let title: LocalizedStringKey = "フリックサジェストの表示時間"
    public static let explanation: LocalizedStringKey = "フリック入力後にサジェスト（方向ガイド）が表示される時間を調整できます。短くすると素早く消え、長くするとゆっくり消えます。"
    public static let defaultValue: Double = 0.07
    public static let key: String = "flick_suggest_dismiss_duration"
}

extension KeyboardSettingKey where Self == FlickSuggestDismissDurationKey {
    public static var flickSuggestDismissDuration: Self { .init() }
}

/// 長押し連打が始まるまでの遅延時間（秒）。0.1〜1.0秒を想定。
public struct KeyLongPressDelayKey: DoubleKeyboardSettingKey {
    public static let title: LocalizedStringKey = "長押し連打の開始速度"
    public static let explanation: LocalizedStringKey = "バックスペースなどを長押ししたとき、連打が始まるまでの時間を調整できます。短くするほど速く連打が始まります。"
    public static let defaultValue: Double = 0.4
    public static let key: String = "key_long_press_delay"
}

extension KeyboardSettingKey where Self == KeyLongPressDelayKey {
    public static var keyLongPressDelay: Self { .init() }
}

/// 長押し連打の間隔（秒）。0.02〜0.5秒を想定。
public struct KeyRepeatIntervalKey: DoubleKeyboardSettingKey {
    public static let title: LocalizedStringKey = "長押し連打の速度"
    public static let explanation: LocalizedStringKey = "バックスペースなどを長押ししたときの連打速度を調整できます。短くするほど速く連打されます。"
    public static let defaultValue: Double = 0.1
    public static let key: String = "key_repeat_interval"
}

extension KeyboardSettingKey where Self == KeyRepeatIntervalKey {
    public static var keyRepeatInterval: Self { .init() }
}

/// キーボードの高さを調整できます。
public struct KeyboardHeightScaleSettingKey: DoubleKeyboardSettingKey {
    public static let title: LocalizedStringKey = "キーボードの高さ"
    public static let explanation: LocalizedStringKey = "キーボードの高さを調整できます。"
    public static let defaultValue: Double = 1
    public static let key: String = "keyboard_height_scale"
}

extension KeyboardSettingKey where Self == KeyboardHeightScaleSettingKey {
    public static var keyboardHeightScale: Self { .init() }
}
