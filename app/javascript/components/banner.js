import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["  Let Bikebnb help you put your bike up for rent or help you rent a good bike around your location"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
