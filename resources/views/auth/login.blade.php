<x-guest-layout>

  <div class="fixed flex justify-center -bottom-10 w-full">
    <img src="{{ asset('images/homiLogo.png') }}" class="h-64 opacity-10" alt="">
  </div>
  <div class="fixed flex justify-center bottom-0 w-full">
    <span class="font-medium text-gray-500">Powered By: J7 IT SOLUTION & SERVICES</span>
  </div>
  <svg
    class="absolute inset-x-0 top-0 -z-10 h-[64rem] w-full stroke-gray-200 [mask-image:radial-gradient(32rem_32rem_at_center,white,transparent)]"
    aria-hidden="true">
    <defs>
      <pattern id="1f932ae7-37de-4c0a-a8b0-a6e3b4d44b84" width="200" height="200" x="50%" y="-1"
        patternUnits="userSpaceOnUse">
        <path d="M.5 200V.5H200" fill="none" />
      </pattern>
    </defs>
    <svg x="50%" y="-1" class="overflow-visible fill-gray-50">
      <path d="M-200 0h201v201h-201Z M600 0h201v201h-201Z M-400 600h201v201h-201Z M200 800h201v201h-201Z"
        stroke-width="0" />
    </svg>
    <rect width="100%" height="100%" stroke-width="0" fill="url(#1f932ae7-37de-4c0a-a8b0-a6e3b4d44b84)" />
  </svg>
  <div class="absolute left-1/2 right-0 top-0 -z-10 -ml-24 transform-gpu overflow-hidden blur-3xl lg:ml-24 xl:ml-48"
    aria-hidden="true">
    <div class="aspect-[801/1036] w-[50.0625rem] bg-gradient-to-tr from-[#009EF5] to-gray-300 opacity-30"
      style="clip-path: polygon(63.1% 29.5%, 100% 17.1%, 76.6% 3%, 48.4% 0%, 44.6% 4.7%, 54.5% 25.3%, 59.8% 49%, 55.2% 57.8%, 44.4% 57.2%, 27.8% 47.9%, 35.1% 81.5%, 0% 97.7%, 39.2% 100%, 35.2% 81.4%, 97.2% 52.8%, 63.1% 29.5%)">
    </div>
  </div>
  <div class="absolute left-0  top-0 -z-10 -ml-24 transform-gpu overflow-hidden blur-3xl lg:mr-24 xl:mr-48"
    aria-hidden="true">
    <div class="aspect-[801/1036] w-[50.0625rem] bg-gradient-to-tr from-[#009EF5] to-gray-300 opacity-30"
      style="clip-path: polygon(63.1% 29.5%, 100% 17.1%, 76.6% 3%, 48.4% 0%, 44.6% 4.7%, 54.5% 25.3%, 59.8% 49%, 55.2% 57.8%, 44.4% 57.2%, 27.8% 47.9%, 35.1% 81.5%, 0% 97.7%, 39.2% 100%, 35.2% 81.4%, 97.2% 52.8%, 63.1% 29.5%)">
    </div>
  </div>
  <div class="flex min-h-full flex-col justify-center py-12 sm:px-6 lg:px-8">


    <div class=" relative sm:mx-auto sm:w-full sm:max-w-md">
      <div class="bg-white px-4 py-8 shadow-lg sm:rounded-lg sm:px-10">
        <div class="sm:mx-auto sm:w-full sm:max-w-md mb-10">
          <img class="mx-auto h-12 w-auto" src="{{ asset('images/homiLogo.png') }}" alt="Your Company">
          <h2 class="mt-4 text-center text-2xl font-alkatra font-bold tracking-tight text-gray-600">Sign in to your
            account
          </h2>
        </div>
        <x-jet-validation-errors class="" />
        <form class="space-y-6 " method="POST" action="{{ route('login') }}">
          @csrf
          <div>
            <x-input icon="identification" label="Email Address" id="email" name="email" :value="old('email')"
              required autofocus placeholder="" />

          </div>

          <div>
            <x-inputs.password label="Password" icon="lock-closed" id="password" name="password" required
              autocomplete="current-password" />
          </div>

          <div class="flex items-center justify-between">
            <div class="flex items-center">
              <input id="remember-me" name="remember-me" type="checkbox"
                class="h-4 w-4 rounded border-gray-300 text-blue-600 focus:ring-blue-600">
              <label for="remember-me" class="ml-2 block text-sm text-gray-900">Remember me</label>
            </div>

            <div class="text-sm">
              <a href="#" class="font-medium text-blue-600 hover:text-indigo-500">Forgot your password?</a>
            </div>
          </div>

          <div>
            <div class="flex w-full items-center">
              <x-button type="submit" blue label="Sign In" class="font-medium w-full" right-icon="arrow-right" />

            </div>
          </div>
        </form>
      </div>
    </div>
  </div>



</x-guest-layout>
