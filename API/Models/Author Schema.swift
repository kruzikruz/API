//
//  Author Schema.swift
//  API
//
//  Created by Kornel Krużewski on 17/05/2023.
//

import Foundation
import SwiftUI

struct UserData: Codable {
    let id: Int
    let name: String
    let url: URL
    let description: String
    let link: URL
    let slug: String
    let avatarURLs: AvatarURLs
    let isSuperAdmin: Bool
    let woocommerceMeta: WooCommerceMeta
    let links: Links

    private enum CodingKeys: String, CodingKey {
        case id, name, url, description, link, slug
        case avatarURLs = "avatar_urls"
        case isSuperAdmin = "is_super_admin"
        case woocommerceMeta = "woocommerce_meta"
        case links = "_links"
    }
}

struct AvatarURLs: Codable {
    let small: String
    let medium: String
    let large: String

    private enum CodingKeys: String, CodingKey {
        case small = "24"
        case medium = "48"
        case large = "96"
    }
}

struct WooCommerceMeta: Codable {
    let variableProductTourShown: String
    let activityPanelInboxLastRead: String
    let activityPanelReviewsLastRead: String
    let categoriesReportColumns: String
    let couponsReportColumns: String
    let customersReportColumns: String
    let ordersReportColumns: String
    let productsReportColumns: String
    let revenueReportColumns: String
    let taxesReportColumns: String
    let variationsReportColumns: String
    let dashboardSections: String
    let dashboardChartType: String
    let dashboardChartInterval: String
    let dashboardLeaderboardRows: String
    let homepageLayout: String
    let homepageStats: String
    let taskListTrackedStartedTasks: String
    let helpPanelHighlightShown: String
    let androidAppBannerDismissed: String

    private enum CodingKeys: String, CodingKey {
        case variableProductTourShown = "variable_product_tour_shown"
        case activityPanelInboxLastRead = "activity_panel_inbox_last_read"
        case activityPanelReviewsLastRead = "activity_panel_reviews_last_read"
        case categoriesReportColumns = "categories_report_columns"
        case couponsReportColumns = "coupons_report_columns"
        case customersReportColumns = "customers_report_columns"
        case ordersReportColumns = "orders_report_columns"
        case productsReportColumns = "products_report_columns"
        case revenueReportColumns = "revenue_report_columns"
        case taxesReportColumns = "taxes_report_columns"
        case variationsReportColumns = "variations_report_columns"
        case dashboardSections = "dashboard_sections"
        case dashboardChartType = "dashboard_chart_type"
        case dashboardChartInterval = "dashboard_chart_interval"
        case dashboardLeaderboardRows = "dashboard_leaderboard_rows"
        case homepageLayout = "homepage_layout"
        case homepageStats = "homepage_stats"
        case taskListTrackedStartedTasks = "task_list_tracked_started_tasks"
        case helpPanelHighlightShown = "help_panel_highlight_shown"
        case androidAppBannerDismissed = "android_app_banner_dismissed"
    }
}

struct Links: Codable {
    let selfLink: [Link]
    let collection: [Link]

    private enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case collection
    }
}

struct Link: Codable {
    let href: URL
}
