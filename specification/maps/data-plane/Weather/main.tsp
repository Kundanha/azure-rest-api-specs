import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-core";
import "./routes.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;
using TypeSpec.Versioning;
using Azure.Core;

/**
 * Azure Maps Weather REST APIs
 */
@useAuth(
  AadOauth2Auth<["https://atlas.microsoft.com/.default"]> | ApiKeyAuth<
    ApiKeyLocation.header,
    "subscription-key"
  > | ApiKeyAuth<ApiKeyLocation.header, "SAS Token">
)
@service(#{ title: "Maps Weather" })
@versioned(Versions)
@server(
  "{endpoint}",
  "Azure Maps Weather REST APIs",
  {
    endpoint: url = "https://atlas.microsoft.com",
  }
)
namespace MapsWeather;

/**
 * The available API versions.
 */
enum Versions {
  /**
   * The 1.1 API version.
   */
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  v1_1: "1.1",
}
