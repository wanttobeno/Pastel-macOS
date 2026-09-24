// CompatMacOS26.swift
// Comprehensive fallback types for macOS < 26 when compiling with MACOS_DEPLOYMENT_TARGET_14

#if MACOS_DEPLOYMENT_TARGET_14
import SwiftUI
import AppKit

// MARK: - GlassEffect fallback

struct GlassEffect: ViewModifier {
    static var regular: GlassEffect { GlassEffect() }
    func tint(_ color: Color?) -> GlassEffect { GlassEffect() }
    func interactive() -> GlassEffect { GlassEffect() }
    func body(content: Content) -> some View { content }
}

// MARK: - GlassEffectContainer fallback

struct GlassEffectContainer<Content: View>: View {
    let spacing: CGFloat
    @ViewBuilder let content: () -> Content
    var body: some View {
        HStack(spacing: spacing, content: content)
    }
}

// MARK: - AnyTransition extension fallback

extension AnyTransition {
    static var matchedGeometry: AnyTransition { .identity }
}

// MARK: - ButtonStyle fallback

struct GlassButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View { configuration.label }
}

struct GlassProminentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View { configuration.label }
}

extension ButtonStyle {
    static var glass: GlassButtonStyle { GlassButtonStyle() }
    static var glassProminent: GlassProminentButtonStyle { GlassProminentButtonStyle() }
}

// MARK: - GlassEffect fallback modifiers on View

extension View {
    @ViewBuilder
    func glassEffect(_ effect: GlassEffect, in shape: some Shape) -> some View {
        self
    }

    @ViewBuilder
    func glassEffectID(_ id: String, in namespace: Namespace.ID) -> some View {
        self
    }

    @ViewBuilder
    func glassEffectTransition(_ transition: AnyTransition) -> some View {
        self
    }

    @ViewBuilder
    func scrollEdgeEffectStyle(_ style: ScrollEdgeEffectStyle, for edges: Edge.Set) -> some View {
        self
    }

    @ViewBuilder
    func contentMargins(_ edge: Edge, _ length: CGFloat, for axes: Axis.Set) -> some View {
        self
    }

    @ViewBuilder
    func scrollIndicators(_ visibility: ScrollIndicators) -> some View {
        self
    }

    @ViewBuilder
    func safeAreaBar<Content: View>(edge: VerticalEdge, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) -> some View {
        self.safeAreaInset(edge: edge, spacing: spacing ?? 0) {
            content()
        }
    }

    @ViewBuilder
    func sharedBackgroundVisibility(_ visibility: Visibility) -> some View {
        self
    }

    @ViewBuilder
    func visibilityPriority(_ priority: ViewPriority) -> some View {
        self
    }

    @ViewBuilder
    func backgroundExtensionEffect() -> some View {
        self
    }

    @ViewBuilder
    func windowResizability(_ behavior: WindowResizability) -> some View {
        self
    }

    @ViewBuilder
    func defaultSize(width: CGFloat, height: CGFloat) -> some View {
        self
    }
}

// MARK: - Toolbar fallback

extension View {
    @ViewBuilder
    func toolbar(removing items: ToolbarRemovalPosition...) -> some View {
        self
    }
}

enum ToolbarRemovalPosition {
    case title
}

// MARK: - ScrollView modifier types

enum ScrollEdgeEffectStyle {
    case soft
    case hard
}

enum ScrollIndicators {
    case visible
    case hidden
}

// MARK: - Background extension effect

extension Color {
    func backgroundExtensionEffect() -> some View { self }
}

// MARK: - Visibility types

enum Visibility {
    case hidden
    case visible
}

enum ViewPriority {
    case high
    case low
}

// MARK: - WindowBackgroundDragBehavior

enum WindowBackgroundDragBehavior {
    case disabled
    case automatic
}

// MARK: - WindowResizability

enum WindowResizability {
    case contentMinSize
}

// MARK: - WindowLaunchBehavior

enum WindowLaunchBehavior {
    case suppressed
    case transparent
}

// MARK: - WindowRestorationBehavior

enum WindowRestorationBehavior {
    case disabled
    case auto
}

// MARK: - ToolbarItem extension fallback

extension ToolbarItem {
    func sharedBackgroundVisibility(_ visibility: Visibility) -> ToolbarItem { self }
    func visibilityPriority(_ priority: ViewPriority) -> ToolbarItem { self }
}

// MARK: - WindowStyle fallback

enum WindowStyle {
    case hiddenTitleBar
}

#endif
