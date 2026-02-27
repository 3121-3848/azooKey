//
//  KeyRepeatSettingView.swift
//  MainApp
//

import AzooKeyUtils
import SwiftUI
import SwiftUIUtils

struct KeyLongPressDelaySettingView: View {
    typealias SettingKey = KeyLongPressDelayKey
    @State private var enabled: Bool
    @State private var setting: SettingUpdater<SettingKey>

    @MainActor init(_ key: SettingKey) {
        self._setting = .init(initialValue: .init())
        _enabled = State(initialValue: SettingKey.value != SettingKey.defaultValue)
    }

    @MainActor private var explanation: LocalizedStringKey {
        switch setting.value {
        case 0.1 ..< 0.2: return "とても短い"
        case 0.2 ..< 0.35: return "短い"
        case 0.35 ..< 0.5: return "普通"
        case 0.5 ..< 0.7: return "長い"
        case 0.7 ... 1.0: return "とても長い"
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
                Slider(value: $setting.value, in: 0.1 ... 1.0)
                Text(explanation)
            }
        }
    }
}

struct KeyRepeatIntervalSettingView: View {
    typealias SettingKey = KeyRepeatIntervalKey
    @State private var enabled: Bool
    @State private var setting: SettingUpdater<SettingKey>

    @MainActor init(_ key: SettingKey) {
        self._setting = .init(initialValue: .init())
        _enabled = State(initialValue: SettingKey.value != SettingKey.defaultValue)
    }

    @MainActor private var explanation: LocalizedStringKey {
        switch setting.value {
        case 0.02 ..< 0.05: return "とても速い"
        case 0.05 ..< 0.08: return "速い"
        case 0.08 ..< 0.13: return "普通"
        case 0.13 ..< 0.25: return "遅い"
        case 0.25 ... 0.5: return "とても遅い"
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
                Slider(value: $setting.value, in: 0.02 ... 0.5)
                Text(explanation)
            }
        }
    }
}
