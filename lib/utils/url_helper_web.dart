// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use

import 'dart:html' as html;
import 'package:flutter/material.dart';

String _initialHash = '';

void captureInitialHash() {
  _initialHash = getHash();
}

String getInitialHash() {
  return _initialHash;
}

void clearInitialHash() {
  _initialHash = '';
}

void initHashListener(VoidCallback onHashChanged) {
  html.window.onHashChange.listen((event) {
    onHashChanged();
  });
  html.window.onPopState.listen((event) {
    onHashChanged();
  });
}

void navigateToProject(String slug) {
  final pathname = html.window.location.pathname ?? '';
  final hash = html.window.location.hash;
  
  String projectsPath = '/projects';
  if (pathname.startsWith('/portfolio')) {
    projectsPath = '/portfolio/projects';
  }
  
  String newUrl = '';
  if (hash.startsWith('#/')) {
    newUrl = '$pathname#/projects#$slug';
  } else {
    newUrl = '$projectsPath#$slug';
  }
  
  html.window.history.pushState(null, html.document.title, newUrl);
  // Dispatch event so the popstate/hashchange listener in Flutter fires immediately
  html.window.dispatchEvent(html.HashChangeEvent('hashchange'));
}

void updateHash(String hash) {
  final pathname = html.window.location.pathname ?? '';
  final currentHash = html.window.location.hash;
  
  String newUrl = pathname;
  if (currentHash.startsWith('#/projects')) {
    newUrl = '$pathname#/projects#$hash';
  } else if (currentHash.startsWith('#/')) {
    newUrl = '$pathname$currentHash#$hash';
  } else {
    newUrl = '$pathname#$hash';
  }
  
  html.window.history.pushState(null, html.document.title, newUrl);
  html.window.dispatchEvent(html.HashChangeEvent('hashchange'));
}

void clearHash() {
  final pathname = html.window.location.pathname ?? '';
  final currentHash = html.window.location.hash;
  
  String newUrl = pathname;
  if (currentHash.startsWith('#/projects#')) {
    newUrl = '$pathname#/projects';
  } else if (currentHash.startsWith('#/')) {
    final secondHashIndex = currentHash.indexOf('#', 2);
    if (secondHashIndex != -1) {
      newUrl = '$pathname${currentHash.substring(0, secondHashIndex)}';
    } else {
      newUrl = '$pathname$currentHash';
    }
  }
  
  html.window.history.pushState(null, html.document.title, newUrl);
  html.window.dispatchEvent(html.HashChangeEvent('hashchange'));
}

String getHash() {
  final hash = html.window.location.hash;
  if (hash.isEmpty) return '';
  
  if (hash.startsWith('#/projects#')) {
    return hash.substring('#/projects#'.length);
  }
  
  if (hash.startsWith('#/')) {
    final secondHashIndex = hash.indexOf('#', 2);
    if (secondHashIndex != -1) {
      return hash.substring(secondHashIndex + 1);
    }
    return '';
  }
  
  if (hash.startsWith('#')) {
    return hash.substring(1);
  }
  
  return hash;
}

bool isProjectsRoute() {
  final pathname = html.window.location.pathname ?? '';
  final hash = html.window.location.hash;
  
  if (pathname.endsWith('/projects') || pathname.endsWith('/projects/')) {
    return true;
  }
  
  if (hash.startsWith('#/projects')) {
    return true;
  }
  
  return false;
}

void updatePathToProjects() {
  final pathname = html.window.location.pathname ?? '';
  final hash = html.window.location.hash;
  
  if (hash.startsWith('#/')) {
    if (!hash.startsWith('#/projects')) {
      html.window.history.pushState(null, html.document.title, '$pathname#/projects');
      html.window.dispatchEvent(html.HashChangeEvent('hashchange'));
    }
  } else {
    String newPath = '/projects';
    if (pathname.startsWith('/portfolio')) {
      newPath = '/portfolio/projects';
    }
    if (pathname != newPath) {
      html.window.history.pushState(null, html.document.title, newPath);
      html.window.dispatchEvent(html.HashChangeEvent('hashchange'));
    }
  }
}

void updatePathToHome() {
  final pathname = html.window.location.pathname ?? '';
  final hash = html.window.location.hash;
  
  if (hash.startsWith('#/')) {
    if (hash.startsWith('#/projects')) {
      html.window.history.pushState(null, html.document.title, '$pathname#/');
      html.window.dispatchEvent(html.HashChangeEvent('hashchange'));
    }
  } else {
    String newPath = '/';
    if (pathname.startsWith('/portfolio')) {
      newPath = '/portfolio/';
    }
    if (pathname != newPath) {
      html.window.history.pushState(null, html.document.title, newPath);
      html.window.dispatchEvent(html.HashChangeEvent('hashchange'));
    }
  }
}
