class JsonString {
  static String nestedJson = ('''
[
  {
    "key": "widget1",
    "widgetType": "container",
    "widgetLayout": {
      "dx": 0.25,
      "dy": 0.25,
      "height": 0.3,
      "width": 0.3,
      "padding": {}
    },
    "widgetStyle": {
      "color": {"r": 255,"g": 0, "b": 0,"opacity": 1},
      "corner": {},
      "shadows": []
    },
    "children": [
      {
        "key": "widget2",
        "widgetType": "container",
        "widgetLayout": {
          "dx": 0.1,
          "dy": 0.1,
          "height": 0.2,
          "width": 0.2,
          "padding": {}
        },
        "widgetStyle": {"color": {"r": 0, "g": 255,"b": 0,"opacity": 1},
          "corner": {},
          "shadows": []
        }
      }
    ]
  }
]

''');

  static String nestedJson2 = '''
[
  {
    "key": "widget1",
    "widgetType": "container",
    "widgetLayout": {
      "dx": 224,
      "dy": 234,
      "height": 245,
      "width": 254,
      "isAbsolutePosition": true,
      "isAbsoluteSize": true,
      "padding": {}
    },
    "widgetStyle": {
      "color": { "r": 255,"g": 0, "b": 0,"opacity": 1},
      "corner": {"topRight": 20.0,"topLeft": 20.0,"bottomRight": 0.0,"bottomLeft": 0.0},
      "shadows": []
    },
    "alignedWithParent": {"x": 1.0,"y": 1.0},
    "children": [
      {
        "key": "widget2",
        "widgetType": "text",
        "widgetLayout": {
          "dx": 0,
          "dy": 0,
          "height": 46,
          "width": 65,
          "isAbsolutePosition": true,
          "isAbsoluteSize": true,
          "padding": {}
        },
        "widgetStyle": {
          "color": { "r": 123,"g": 23,"b": 56,"opacity": 1},
          "corner": { "topRight": 10.0, "topLeft": 10.0, "bottomRight": 0.0, "bottomLeft": 0.0},
          "shadows": []
        },
        "textInfo": {
          "content": { "text": "World"},
          "style": {
            "color": {"r": 125, "g": 0, "b": 255 },
            "size": 14.0,
            "weight": 700,
            "underline": true
          }
        }
      }
    ]
  },
  {
    "key": "widget3",
    "widgetType": "container",
    "widgetLayout": {
      "dx": 0,
      "dy": 0,
      "height": 123,
      "width": 132,
      "isAbsolutePosition": true,
      "isAbsoluteSize": true,
      "padding": {}
    },
    "widgetStyle": {
      "color": {"r": 0,"g": 0, "b": 255, "opacity": 1},
      "corner": { "topRight": 0.0, "topLeft": 0.0, "bottomRight": 20.0,"bottomLeft": 20.0},
      "shadows": []
    },
    
    "alignedWithParent": {"x": -1.0,"y": -1.0},
    "children": [
      {
        "key": "widget2",
        "widgetType": "text",
        "widgetLayout": {
          "dx": 0,
          "dy": 0,
          "height": 46,
          "width": 65,
          "isAbsolutePosition": true,
          "isAbsoluteSize": true,
          "padding": {}
        },
        "widgetStyle": {
          "color": { "r": 123,"g": 23,"b": 56,"opacity": 1},
          "corner": { "topRight": 10.0, "topLeft": 10.0, "bottomRight": 0.0, "bottomLeft": 0.0},
          "shadows": []
        },
        "textInfo": {
          "content": { "text": "Flutter"},
          "style": {
            "color": {"r": 225, "g": 34, "b": 255 },
            "size": 14.0,
            "weight": 700,
            "underline": true
          }
        }
      }
    ]
  }
]
  ''';

  static String nestedJson3 = '''

[
 
  {
    "key": "widget2",
    "widgetType": "container",
    "widgetLayout": {
      "dx": 0,
      "dy": 0,
      "height": 123,
      "width": 132,
      "isAbsolutePosition": true,
      "isAbsoluteSize": true,
      "padding": {}
    },
    "widgetStyle": {
      "color": {"r": 0,"g": 0,"b": 255,"opacity": 1},
      "corner": {"topRight": 0,"topLeft": 0,"bottomRight": 20,"bottomLeft": 20},
      "shadows": []
    },
    "alignedWithParent": {"x": -1,"y": -1},
    "children": [
      {
        "key": "child2",
        "widgetType": "container",
        "widgetLayout": {
          "dx": 0,
          "dy": 0,
          "height": 65,
          "width": 76,
          "isAbsolutePosition": true,
          "isAbsoluteSize": true,
          "padding": {}
        },
        "widgetStyle": {
          "color": {"r": 155,"g": 0,"b": 0,"opacity": 1 }
        },
        "children": [
          {
            "key": "grandchild2",
            "widgetType": "text",
            "widgetLayout": {
              "dx": 0,
              "dy": 0,
              "height": 46,
              "width": 65,
              "isAbsolutePosition": true,
              "isAbsoluteSize": true,
              "padding": {}
            },
            "widgetStyle": {
              "color": {"r": 123,"g": 23, "b": 56,"opacity": 1 },
              "corner": {"topRight": 10, "topLeft": 10,"bottomRight": 0, "bottomLeft": 0},
              "shadows": []
            },
            "textInfo": {
              "content": {"text": "Grandchild 2" },
              "style": {"color": {"r": 125,"g": 0,"b": 255},
                "size": 14,
                "weight": 700,
                "underline": true
              }
            }
          }
        ]
      }
    ]
  }
]
 ''';

  static String nestedJson4 = '''
[
  {
    "key": "widget1",
    "widgetType": "container",
    "widgetLayout": {
      "dx": 224,
      "dy": 234,
      "height": 245,
      "width": 254,
      "isAbsolutePosition": true,
      "isAbsoluteSize": true,
      "padding": {}
    },
    "widgetStyle": {
      "color": { "r": 255, "g": 0, "b": 0, "opacity": 1 },
      "corner": { "topRight": 20, "topLeft": 20,  "bottomRight": 0, "bottomLeft": 0},
      "shadows": []
    },
    "alignedWithParent": {"x": 1, "y": 1},
    "children": [
      {
        "key": "child1",
        "widgetType": "container",
        "widgetLayout": {
          "dx": 0,
          "dy": 0,
          "height": 65,
          "width": 76,
          "isAbsolutePosition": true,
          "isAbsoluteSize": true,
          "padding": {}
        },
        "widgetStyle": {"color": {"r": 255, "g": 0, "b": 0, "opacity": 1}},
        "children": [
          {
            "key": "grandchild1",
            "widgetType": "text",
            "widgetLayout": {
              "dx": 0,
              "dy": 0,
              "height": 46,
              "width": 65,
              "isAbsolutePosition": true,
              "isAbsoluteSize": true,
              "padding": {}
            },
            "widgetStyle": {
              "color": {"r": 123,"g": 23,"b": 56,"opacity": 1},
              "corner": {"topRight": 10, "topLeft": 10, "bottomRight": 0, "bottomLeft": 0},
              "shadows": []
            },
            "textInfo": {
              "content": {"text": "Grandchild 1"},
              "style": {
                "color": {"r": 125,"g": 0,"b": 255},
                "size": 14,
                "weight": 700,
                "underline": true
              }
            }
          }
        ]
      }
    ]
  },
  {
    "key": "widget2",
    "widgetType": "container",
    "widgetLayout": {
      "dx": 0,
      "dy": 0,
      "height": 123,
      "width": 132,
      "isAbsolutePosition": true,
      "isAbsoluteSize": true,
      "padding": {}
    },
    "widgetStyle": {
      "color": {"r": 0,"g": 0,"b": 255,"opacity": 1},
      "corner": {"topRight": 0,"topLeft": 0,"bottomRight": 20,"bottomLeft": 20},
      "shadows": []
    },
    "alignedWithParent": {"x": -1,"y": -1},
    "children": [
      {
        "key": "child2",
        "widgetType": "container",
        "widgetLayout": {
          "dx": 0,
          "dy": 0,
          "height": 65,
          "width": 76,
          "isAbsolutePosition": true,
          "isAbsoluteSize": true,
          "padding": {}
        },
        "widgetStyle": {
          "color": {"r": 155,"g": 0,"b": 0,"opacity": 1}
        },
        "children": [
          {
            "key": "grandchild2",
            "widgetType": "text",
            "widgetLayout": {
              "dx": 0,
              "dy": 0,
              "height": 46,
              "width": 65,
              "isAbsolutePosition": true,
              "isAbsoluteSize": true,
              "padding": {}
            },
            "widgetStyle": {
              "color": {"r": 123,"g": 23,"b": 56,"opacity": 1},
              "corner": {"topRight": 10,"topLeft": 10,"bottomRight": 0,"bottomLeft": 0},
              "shadows": []
            },
            "textInfo": {
              "content": {"text": "Grandchild 2"},
              "style": {
                "color": {"r": 125,"g": 0,"b": 255},
                "size": 14,
                "weight": 700,
                "underline": true
              }
            }
          }
        ]
      }
    ]
  },
  {
    "key": "widget3",
    "widgetType": "button",
    "widgetLayout": {
      "dx": 0.6,
      "dy": 0.7,
      "height": 0.3,
      "width": 0.4,
      "isAbsolutePosition": false,
      "isAbsoluteSize": false,
      "padding": {}
    },
    "widgetStyle": {
      "color": {"r": 145, "g": 123,"b": 55, "opacity": 1},
      "corner": {"topRight": 5,"topLeft": 5,"bottomRight": 5,"bottomLeft": 5},
      "shadows": []
    },
    "textInfo": {
      "content": {"text": "Click Me"},
      "style": {
        "color": {"r": 155,"g": 205, "b": 55},
        "size": 16,
        "weight": 800,
        "underline": false
      }
    }
  }
]
 ''';

  static String nestedJson5 = '''
  {
  "widgets": [
    {
      "key": "button1",
      "type": "button",
      "layout": {
        "dx": 50,
        "dy": 50,
        "height": 50,
        "width": 150,
        "absolutePosition": true,
        "absoluteSize": true,
        "padding": {"left": 10, "top": 5, "right": 10, "bottom": 5}
      },
      "style": {
        "color": {"r": 0, "g": 123, "b": 255, "opacity": 1},
        "corner": {"topRight": 5, "topLeft": 5, "bottomRight": 5, "bottomLeft": 5},
        "shadows": [
          {
            "color": {"r": 0, "g": 0, "b": 0, "opacity": 0.25},
            "offset": {"dx": 2, "dy": 2},
            "blurRadius": 4,
            "spreadRadius": 1
          }
        ]
      },
      "textInfo": {
        "content": {"text": "Click Me"},
        "style": {"color": {"r": 255, "g": 255, "b": 255, "opacity": 1}, "size": 16, "weight": 400, "underline": false}
      },
      "buttonType": "elevated",
      "onPressed": "handleClick"
    }
  ]
}

  ''';

  static String nestedJson6 = '''
[
  {
    "key": "widget1",
    "widgetType": "container",
    "widgetLayout": {
      "dx": 0.25,
      "dy": 0.25,
      "height": 0.3,
      "width": 0.3,
      "padding": {}
    },
    "widgetStyle": {
      "color": {"r": 255,"g": 0, "b": 0,"opacity": 1},
      "corner": {},
      "shadows": []
    },
    "children": [
      {
        "key": "widget2",
        "widgetType": "container",
        "widgetLayout": {
          "dx": 0.1,
          "dy": 0.1,
          "height": 0.2,
          "width": 0.2,
          "padding": {}
        },
        "widgetStyle": {
          "color": {"r": 0, "g": 255,"b": 0,"opacity": 1},
          "corner": {},
          "shadows": []
        }
      },
      {
        "key": "widgetButton1",
        "widgetType": "button",
        "widgetLayout": {
          "dx": 0.2,
          "dy": 0.1,
          "height": 0.5,
          "width": 0.5,
          "padding": {"left": 5, "top": 5, "right": 5, "bottom": 5}
        },
        "widgetStyle": {
          "color": {"r": 33,"g": 123,"b": 255,"opacity": 0.45},
          "corner": {"topRight": 5, "topLeft": 5, "bottomRight": 5, "bottomLeft": 5},
          "shadows": [{"color": {"r": 0,"g": 123,"b": 234,"opacity": 1}, "offsetX": 2, "offsetY": 2, "blurRadius": 5, "spreadRadius": 1}]
        },
        "buttonInfo": {
          "action": {"onPressed": "handleClick"},
          "colorStyle":{
              "focusedColor": {"r": 0, "g": 0, "b": 255, "opacity": 0.8},
              "hoveredColor": {"r": 0, "g": 255, "b": 0, "opacity": 0.6},
              "pressedColor": {"r": 255, "g": 0, "b": 0, "opacity": 0.4}
          }
          
        },
        "textInfo": {
          "content": { "text": "Button !"},
          "style": {
            "color": {"r": 125, "g": 34, "b": 55 },
            "size": 14.0,
            "weight": 700,
            "underline": true
          }
        }
      }
    ]
  }
  
]

''';
}
