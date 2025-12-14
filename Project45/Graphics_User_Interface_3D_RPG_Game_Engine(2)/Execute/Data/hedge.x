xof 0303txt 0032
template XSkinMeshHeader {
 <3cf169ce-ff7c-44ab-93c0-f78f62d172e2>
 WORD nMaxSkinWeightsPerVertex;
 WORD nMaxSkinWeightsPerFace;
 WORD nBones;
}

template VertexDuplicationIndices {
<b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}

template SkinWeights {
 <6f0d123b-bad2-4167-a0d0-80224f25fabb>
 STRING transformNodeName;
 DWORD nWeights;
 array DWORD vertexIndices[nWeights];
 array FLOAT weights[nWeights];
 Matrix4x4 matrixOffset;
}


Frame Scene_Root {


 FrameTransformMatrix {
  1.000000, 0.000000, 0.000000, 0.000000,
  0.000000, 1.000000, 0.000000, 0.000000,
  0.000000, 0.000000, 1.000000, 0.000000,
  0.000000, 0.000000, 0.000000, 1.000000;;
 }

  Frame Plane01 {

   FrameTransformMatrix {
    1.000000, 0.000000, 0.000000, 0.000000,
    0.000000, 1.000000, 0.000000, 0.000000,
    0.000000, 0.000000, 1.000000, 0.000000,
    0.000000, 0.000000, 0.000000, 1.000000;;
   }

   Mesh {
    4;
    73.550720;74.999992;0.289850;,
    -76.449280;-74.999992;0.289859;,
    -76.449280;74.999992;0.289850;,
    73.550720;-74.999992;0.289859;;
    2;
    3;0,2,1;,
    3;1,3,0;;

    MeshNormals {
     4;
     0.000000;0.000000;1.000000;,
     0.000000;0.000000;1.000000;,
     0.000000;0.000000;1.000000;,
     0.000000;0.000000;1.000000;;
     2;
     3;0,2,1;,
     3;1,3,0;;
    }

    MeshTextureCoords {
     4;
     1.000000;0.000000;,
     0.000000;1.000000;,
     0.000000;0.000000;,
     1.000000;1.000000;;
    }

    VertexDuplicationIndices {
     4;
     4;
     0,
     1,
     2,
     3;
    }

    MeshMaterialList {
     1;
     2;
     0,
     0;

     Material Material01 {
      0.588235;0.588235;0.588235;1.000000;;
      0.100000;
      0.898039;0.898039;0.898039;;
      0.000000;0.000000;0.000000;;
      TextureFilename {
       "HEDGE.BMP";
      }
     }
    }

    XSkinMeshHeader {
     1;
     3;
     0;
    }

   }
 }
 }
}

AnimationSet AnimationSet0 {

 Animation {

  AnimationKey {
   4;
   2;
   0; 16; 1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000;;,
   -1; 16; 1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000;;;
  }
  { Scene_Root }
 }

}

