'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7423c67d77accbf88879ac849b7697ee",
"assets/AssetManifest.bin.json": "a14925f594acb1939654eadf7c5ab668",
"assets/AssetManifest.json": "38e6a9b20d1c324e34d774dcbf1a5834",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "eaaee2043c2ea183d6787be60bd2275b",
"assets/lib/icons/burger.png": "d0535ecbcc66dff066a949ce40c8e044",
"assets/lib/icons/donut.png": "071978b7f23e69404dcd474a116c48f8",
"assets/lib/icons/pancakes.png": "f452e93e2f7c9b4affbe1f1c8f0ba6fa",
"assets/lib/icons/pizza.png": "4898fbef9f1e1bb179e3c03b54aa7511",
"assets/lib/icons/smoothie.png": "48775724d7f2aca2f704504a444f1026",
"assets/lib/images/Burger1.png": "72e4232ad8a273336440cf3b1fcd1138",
"assets/lib/images/Burger2.png": "69f82c9ce816a8ec6ab15d0633ee8bc3",
"assets/lib/images/Burger3.png": "c2dbb6b4f78548ef7712be8c8791f724",
"assets/lib/images/Burger4.png": "e3885aaad7d9b8ac958184fbc78bac37",
"assets/lib/images/Burger5.png": "e67413198c75fb422405c216c607fa8c",
"assets/lib/images/Burger6.png": "88da0bb6486b3f67c83c7081e080e7fc",
"assets/lib/images/Burger7.png": "3400ef86fd93b2e702198131b7c97a51",
"assets/lib/images/Burger8.png": "2c3e367bee0bc2949740e68abed1a699",
"assets/lib/images/chocolate_donut.png": "b4b987dfe8c991ddc2bf732936875067",
"assets/lib/images/grape_donut.png": "0452cb13973b28996be5791f153f6e06",
"assets/lib/images/icecream_donut.png": "1e1a3df4e232dd9d533bd499a2b2d09b",
"assets/lib/images/Pancake1.png": "32d4605da475f62843e63607ed2e7250",
"assets/lib/images/Pancake2.png": "b9b22525c9378d8100c8fa0c3979cac5",
"assets/lib/images/Pancake3.png": "cae89c6590c618c5ff0af598fba70563",
"assets/lib/images/Pancake4.png": "ef49979985ede9199e62ca805f289b41",
"assets/lib/images/Pancake5.png": "dfa927f45c81ae6a5cfd7b585047f4f1",
"assets/lib/images/Pancake6.png": "8a8a46bb1f0312385020904bb3a8d0d8",
"assets/lib/images/Pancake7.png": "73392dd9174b4013fbfb5361337a8258",
"assets/lib/images/Pancake8.png": "089a2ccad19b1e64d0172e7fdb224d2a",
"assets/lib/images/Pancake9.png": "274f6e446b3a44f8323e578a929adde9",
"assets/lib/images/pizza1.png": "0b0b3c525be72587210f80e24a9c3b26",
"assets/lib/images/pizza2.png": "3fd9a76da1f39ddc04566a95ee2c222a",
"assets/lib/images/pizza3.png": "458d2ad854f3ed7177145799ee8f5ea8",
"assets/lib/images/pizza4.png": "e185be7178afba40daacd429e9539e0f",
"assets/lib/images/pizza5.png": "a1dbf6c1ab6961c6ca73c32d82e601fb",
"assets/lib/images/pizza6.png": "fb287ac734a392ba98223cc33facaba1",
"assets/lib/images/pizza7.png": "9ca6dbf0beb6ba3641cdb3bbb26463b5",
"assets/lib/images/pizza8.png": "e1ff59aec376e7e5408e2937667faa48",
"assets/lib/images/Smoothie1.png": "1aa9919222714ed3c4a594e761d816ff",
"assets/lib/images/Smoothie2.png": "12a33348d4957d0fe8feefc93f0cc75b",
"assets/lib/images/Smoothie3.png": "acbe3d4585991299829e217225a29ae3",
"assets/lib/images/Smoothie4.png": "d48c395dede15aacf1e56aee5066761c",
"assets/lib/images/Smoothie5.png": "cb68d0d50c69212cb4a2d2bfb393b50d",
"assets/lib/images/Smoothie6.png": "f32976f532a122a38b5cb0a202290f8a",
"assets/lib/images/Smoothie7.png": "478904bae2f91c40f195214bfa3b8a37",
"assets/lib/images/Smoothie8.png": "9cbf97180b9d328aad6df2d9ba6d296c",
"assets/lib/images/strawberry_donut.png": "19fac450af106b5d24f68f4dd9ced3e1",
"assets/NOTICES": "801b9071543607c1d4f3cca9116d1cee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "e38b64071db7f3e1134af306abdd6154",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "52a28ca051ff88a647105737d11eae77",
"/": "52a28ca051ff88a647105737d11eae77",
"main.dart.js": "e97456797b80077feb07aa46f2edebf5",
"manifest.json": "70cebdfb1645371c55a07b7937fae8e8",
"version.json": "dea34c38b15c0b9267f200451de96d38"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
