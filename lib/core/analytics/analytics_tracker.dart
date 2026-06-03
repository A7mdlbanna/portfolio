import 'package:portfolio/core/analytics/analytics_events.dart';
import 'package:portfolio/core/analytics/analytics_service.dart';

class AnalyticsTracker {
  static String? _lastTrackedProjectId;
  static String? _lastTrackedEventName;

  static bool _shouldTrack(String eventName, String? projectId) {
    if (projectId == null || projectId.isEmpty) return true;
    if (_lastTrackedProjectId == projectId && _lastTrackedEventName == eventName) {
      return false; // Deduplicate consecutive duplicate triggers of the same event for the same project
    }
    _lastTrackedProjectId = projectId;
    _lastTrackedEventName = eventName;
    return true;
  }

  /// Clears the last tracked project cache. Call when project details modal is dismissed.
  static void clearLastTrackedProject() {
    _lastTrackedProjectId = null;
    _lastTrackedEventName = null;
  }

  /// Tracks when a project details modal is opened in the app.
  static void trackProjectOpen(String projectId) {
    if (!_shouldTrack(AnalyticsEvents.projectOpen, projectId)) return;
    AnalyticsService.instance.logEvent(AnalyticsEvents.projectOpen, {
      'project_id': projectId,
    });
  }

  /// Tracks when a user deep-links directly into a project via URL hash.
  static void trackDeepLink(String projectId) {
    if (!_shouldTrack(AnalyticsEvents.projectOpenDeeplink, projectId)) return;
    AnalyticsService.instance.logEvent(AnalyticsEvents.projectOpenDeeplink, {
      'project_id': projectId,
    });
  }

  /// Tracks when a project store or demo link button is clicked.
  static void trackProjectLinkClick({
    required String projectId,
    required String url,
    required String type, // 'store' or 'demo'
  }) {
    AnalyticsService.instance.logEvent(AnalyticsEvents.projectLinkClick, {
      'project_id': projectId,
      'url': url,
      'type': type,
    });
  }

  /// Tracks when a social connection link in the footer is clicked.
  static void trackSocialClick({
    required String platform,
    required String url,
  }) {
    AnalyticsService.instance.logEvent(AnalyticsEvents.socialClick, {
      'platform': platform,
      'url': url,
    });
  }
}
