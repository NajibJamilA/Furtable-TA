import 'dart:ui';
import 'package:vector_math/vector_math_64.dart' as VectorMath;
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart';

import '../../models/furniture.dart';

class ARController extends GetxController {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARAnchorManager? arAnchorManager;

  ARNode? localObjectNode;
  ARNode? webObjectNode;

  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];

  int currentIndex = 0;

  List<Color> objectColors = [
    const Color(0xFF5E5E5E),
    const Color(0xFFCBBBAC),
    const Color(0xFFA0CAF0)
  ];

  List<String> arPath = [
    'assets/ar_objects/sofa/sofa_black/untitled.gltf',
    'assets/ar_objects/sofa/sofa_cream/SofaCream.gltf',
    'assets/ar_objects/sofa/sofa_blue/SofaBlue.gltf',
  ];

  List<Furniture> listFurniture = [];


  @override
  void onInit() {
    listFurniture = Get.arguments['furniture'];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager?.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "Images/triangle.png",
      showWorldOrigin: false,
      handleTaps: true,
      handlePans: true,
      handleRotation: true,
      showAnimatedGuide: false,
    );

    this.arObjectManager?.onInitialize();
    this.arSessionManager?.onPlaneOrPointTap = onPlaneOrPointTapped;
    this.arObjectManager?.onPanStart = onPanStarted;
    this.arObjectManager?.onPanChange = onPanChanged;
    this.arObjectManager?.onPanEnd = onPanEnded;
    this.arObjectManager?.onRotationStart = onRotationStarted;
    this.arObjectManager?.onRotationChange = onRotationChanged;
    this.arObjectManager?.onRotationEnd = onRotationEnded;
  }

  Future<void> onRemoveEverything() async {
    /*nodes.forEach((node) {
      this.arObjectManager.removeNode(node);
    });*/
    for (var anchor in anchors) {
      arAnchorManager!.removeAnchor(anchor);
    }
    anchors = [];
  }

  Future<void> onLocalObjectButtonPressed() async {
    if (localObjectNode != null) {
      arObjectManager?.removeNode(localObjectNode!);
      localObjectNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.localGLTF2,
          uri: 'assets/ar_objects/sofa/sofa_blue/SofaBlue.gltf',
          scale: VectorMath.Vector3(100, 100, 100),
          position: VectorMath.Vector3(0.0, 0.0, 0.0),
          rotation: VectorMath.Vector4(1.0, 0.0, 0.0, 0.0));
      bool? didAddLocalNode = await arObjectManager?.addNode(newNode);
      localObjectNode = (didAddLocalNode!) ? newNode : null;
    }
  }

  Future<void> onWebObjectAtButtonPressed() async {
    if (webObjectNode != null) {
      arObjectManager?.removeNode(webObjectNode!);
      webObjectNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.webGLB,
          uri:
          "https://drive.google.com/file/d/1be0eVwLsp5O0BEHUGBgBHy2xeR9o_82x/view?usp=sharing",
          scale: VectorMath.Vector3(0.2, 0.2, 0.2));
      bool? didAddWebNode = await arObjectManager?.addNode(newNode);
      webObjectNode = (didAddWebNode!) ? newNode : null;
    }
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    var singleHitTestResult = hitTestResults.firstWhere(
            (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    var newAnchor =
    ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
    bool? didAddAnchor = await arAnchorManager!.addAnchor(newAnchor);
    if (didAddAnchor!) {
      anchors.add(newAnchor);
      // Add note to anchor
      var newNode = ARNode(
          type: NodeType.localGLTF2,
          uri: listFurniture[0].name == 'Suji Rak'
              ? 'assets/ar_objects/rack/scene.gltf'
              : arPath[currentIndex],
          scale: listFurniture[0].name == 'Suji Rak'
              ? VectorMath.Vector3(0.4, 0.4, 0.4)
              : VectorMath.Vector3(1.2, 1.2, 1.2),
          position: VectorMath.Vector3(0.0, 0.0, 0.0),
          rotation: VectorMath.Vector4(1.0, 0.0, 0.0, 0.0));
      bool? didAddNodeToAnchor =
      await arObjectManager!.addNode(newNode, planeAnchor: newAnchor);
      if (didAddNodeToAnchor!) {
        nodes.add(newNode);
      } else {
        arSessionManager!.onError("Adding Node to Anchor failed");
      }
    } else {
      arSessionManager!.onError("Adding Anchor failed");
    }
  }



  onPanStarted(String nodeName) {
    print("Started panning node $nodeName");
  }

  onPanChanged(String nodeName) {
    print("Continued panning node $nodeName");
  }

  onPanEnded(String nodeName, Matrix4 newTransform) {
    print("Ended panning node $nodeName");
    final pannedNode =
    nodes.firstWhere((element) => element.name == nodeName);

    /*
    * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
    * (e.g. if you intend to share the nodes through the cloud)
    */
    //pannedNode.transform = newTransform;
  }

  onRotationStarted(String nodeName) {
    print("Started rotating node $nodeName");
  }

  onRotationChanged(String nodeName) {
    print("Continued rotating node $nodeName");
  }

  onRotationEnded(String nodeName, Matrix4 newTransform) {
    print("Ended rotating node $nodeName");
    final rotatedNode =
    nodes.firstWhere((element) => element.name == nodeName);

    /*
    * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
    * (e.g. if you intend to share the nodes through the cloud)
    */
    //rotatedNode.transform = newTransform;
  }
}