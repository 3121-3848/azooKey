//
//  FlickSuggestDismissDurationSettingView.swift
//  MainApp
//

import AzooKeyUtils
import SwiftUI
import SwiftUIUtils

struct FlickSuggestDismissDurationSettingView: View {
    typealias SettingKey = FlickSuggestDismissDurationKey
    @State private var enabled: Bool
    @State private var setting: SettingUpdater<SettingKey>

    @MainActor init(_ key: SettingKey) {
        self._setting = .init(initialValue: .init())
        _enabled = State(initialValue: SettingKey.value != SettingKey.defaultValue)
    }

    @MainActor private var explanation: LocalizedStringKey {
        switch setting.value {
        case 0 ..< 0.02: return "すぐ消える"
        case 0.02 ..< 0.05: return "やや短い"
        case 0.05 ..< 0.08: return "普通"
        case 0.08 ..< 0.09: return "やや長い"
        case 0.09 ... 0.1: return "長い"
        default: return "普通"
        }
    }

    var body: some View {
        Toggle(isOn: $enabled) {
            HStack {
                Text(SettingKey.title)
                HelpAlertButton(title: SettingKey.title, explanation: SettingKey.explanation)
            }
        }
        .onChange(of: enabled) { (_, newValue) in
            if !newValue {
                setting.value = SettingKey.defaultValue
            }
        }
        if enabled {
            VStack {
                Slider(value: $setting.value, in: 0 ... 0.1)
                Text(explanation)
            }
        }
    }
}
