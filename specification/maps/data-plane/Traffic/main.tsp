import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-core";
import "./routes.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;
using TypeSpec.Versioning;
using Azure.Core;

/**
 * Azure Maps Traffic REST APIs
 */
@useAuth(
  AadOauth2Auth<["https://atlas.microsoft.com/.default"]> | ApiKeyAuth<
    ApiKeyLocation.header,
    "subscription-key"
  > | ApiKeyAuth<ApiKeyLocation.header, "SAS Token">
)
@service(#{ title: "Maps Traffic" })
@versioned(Versions)
@server(
  "{endpoint}",
  "Azure Maps Traffic REST APIs",
  {
    endpoint: url = "https://atlas.microsoft.com",
  }
)
namespace MapsTraffic;

/**
 * The available API versions.
 */
enum Versions {
  /**
   * The 2025-01-01 API version.
   */
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  v2025_01_01: "2025-01-01",
}
