# muduo compat and Boost dependencies

- muduo upstream: `chenshuo/muduo`, release `v2.0.3`, BSD-3-Clause.
- muduo is packaged as Form B from the GitHub release archive; direct source compilation includes muduo base/network/poller units and excludes optional examples, protobuf/RPC, and contrib targets. The upstream empty `boilerplate.cc` is excluded because its referenced `BoilerPlate.h` is absent from the archive.
- muduo archive SHA-256: `5e90c2f07074ed5ab9347959edc8d387e40a57fbffb92e4a99cfb9a230851371` (two matching calculations).
- Dependency research from the actual compiler errors and upstream include tree found `boost/operators.hpp`, `boost/any.hpp`, and `boost/circular_buffer.hpp`. `boost/operators.hpp` is provided by Boost.Utility; that descriptor already existed. Added `compat.boost-any` and `compat.boost-circular-buffer`; the latter's transitive include closure also required adding `compat.boost-concept-check`.
- Added Boost component versions all follow the index's 1.92.0 train:
  - `compat.boost-any`, upstream `boostorg/any`, BSL-1.0; SHA-256 `335090455387b06b356bbc317d4949f6e7455165942bd7f50dbfe9cab96d624a`.
  - `compat.boost-circular-buffer`, upstream `boostorg/circular_buffer`, BSL-1.0; SHA-256 `0845c8f06fe5a40ef5955360f37054bd8bb856d2ecd4ae5daa8c04252358e34e`.
  - `compat.boost-concept-check`, upstream `boostorg/concept_check`, BSL-1.0; SHA-256 `8dbd2385b0045eddb4c0f071f3c9740c1e61fa3c4cb50d29e139b4b05f55b7e8`.
- SHA-256 values above were computed twice per archive. CN mirrors are not configured; descriptors use plain upstream URL strings until matching GitCode assets are available.
- muduo depends on `compat.boost-any`, `compat.boost-circular-buffer`, and existing `compat.boost-utility`.
- Workspace tests: `boost-any` checks value storage/cast/clear; `boost-circular-buffer` checks bounded overwrite; `boost-concept-check` compiles concept assertions; `muduo` checks Buffer behavior.
- Verification: `mcpp test -p boost-any`, `mcpp test -p boost-circular-buffer`, `mcpp test -p boost-concept-check`, and `mcpp test -p muduo` passed on the local Linux toolchain. The environment emitted its existing default-SubOS-description warning; it did not fail these runs.
- Platform caveat: all source descriptors declare the three xpm platforms, but muduo behavior is intended for Linux/macOS; macOS/Windows CI still needs to establish actual support.
